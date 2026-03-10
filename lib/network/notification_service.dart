import 'dart:convert';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:baby_eduction/storage/secure_storage_service.dart';
import 'package:baby_eduction/storage/storage_key.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:html/parser.dart' as parser;

class NotificationServices {
  NotificationServices._();
  static final NotificationServices instance = NotificationServices._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _androidChannel =
      AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
  );

  bool _isInitialized = false;

  Future<void> initialize(BuildContext context) async {
    if (_isInitialized) return;

    // 1. Request permissions
    await _requestPermissions();

    // 2. Setup local notifications
    await _initLocalNotifications();

    // 3. Foreground messages → show local notification
    _setupForegroundListener();

    // 4. Handle taps (background & terminated)
    await _setupInteractionHandler(context);

    // 5. Subscribe to topics
    await _subscribeToTopics();

    // 6. Token refresh listener
    _listenTokenRefresh();

    _isInitialized = true;
  }

  Future<void> _requestPermissions() async {
    try {
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        debugPrint('Notification permission granted');
      } else {
        debugPrint('Notification permission denied');
        if (Platform.isAndroid || Platform.isIOS) {
          await AppSettings.openAppSettings();
        }
      }

      if (Platform.isIOS) {
        await _firebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
    } catch (e) {
      debugPrint('Permission request error: $e');
    }
  }

  Future<void> _initLocalNotifications() async {
    if (Platform.isAndroid) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_androidChannel);
    }

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        debugPrint('Notification tapped - payload: $payload');
        // Parse payload and navigate here if needed (e.g. using go_router)
      },
    );
  }

  void _setupForegroundListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('''
      ┌───────────────────────────── FCM Message ─────────────────────────────
      Message ID     : ${message.messageId}
      From           : ${message.from}
      Notification?  : ${message.notification != null ? 'YES' : 'NO'}
      Data           : ${message.data}
      Title/Body     : ${message.notification?.title} / ${message.notification?.body}
      Image (notif)  : ${message.notification?.android?.imageUrl ?? message.notification?.apple?.imageUrl}
      ├───────────────────────────────────────────────────────────────────────''');

      _showLocalNotificationFromMessage(message);
    });
  }

  Future<void> _showLocalNotificationFromMessage(RemoteMessage message) async {
    String title = 'Baby Education';
    String body = 'You have a new message';
    String? imageUrl;
    final data = message.data;
    final notification = message.notification;

    if (notification != null) {
      title =removeHtmlTags(notification.title ?? title);
      body = removeHtmlTags(notification.body ?? body);
      imageUrl = notification.android?.imageUrl ?? notification.apple?.imageUrl ;
    }

    if (data.isNotEmpty) {
      title = data['title']?.toString() ?? title;
      body = data['body']?.toString() ?? body;
      imageUrl ??= data['image']?.toString() ?? data['imageUrl']?.toString();
    }

    // 3. Try to handle multilingual JSON (your original logic)
    try {
      final parsedTitle = json.decode(title);
      if (parsedTitle is Map) title = parsedTitle['en']?.toString() ?? title;
    } catch (_) {}

    try {
      final parsedBody = json.decode(body);
      if (parsedBody is Map) body = parsedBody['en']?.toString() ?? body;
    } catch (_) {}

    debugPrint('→ Showing: "$title" | "$body" | Image: $imageUrl');

    final androidDetails = AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      playSound: true,
      // ── Big picture style when image available ──
      styleInformation: imageUrl != null && imageUrl.isNotEmpty
          ? BigPictureStyleInformation(
              FilePathAndroidBitmap(imageUrl), // remote HTTPS URL usually works
              largeIcon: FilePathAndroidBitmap(imageUrl),
              contentTitle: title,
              summaryText: body,
              htmlFormatContentTitle: true,
              htmlFormatSummaryText: true,
            )
          : BigTextStyleInformation(body),
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    try {
      await _localNotifications.show(
        id,
        title,
        body,
        notificationDetails,
        payload: jsonEncode(data), // pass full data for tap handling
      );
      debugPrint('Local notification shown successfully (id: $id)');
    } catch (e) {
      debugPrint('Failed to show local notification: $e');
    }
  }

  Future<void> _subscribeToTopics() async {
    try {
      final userId = await SecureStorageService().read(key: StorageKeys.userId);
      if (userId != null && userId.isNotEmpty) {
        await _firebaseMessaging.subscribeToTopic('firebase_notification_STUDENT_$userId');
        await _firebaseMessaging.subscribeToTopic('firebase_notification_STUDENT');


        debugPrint('Subscribed to: firebase_notification_STUDENT_$userId');
      }
    } catch (e) {
      debugPrint('Topic subscription failed: $e');
    }
  }

  Future<String?> getFcmToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      debugPrint('FCM Token: $token');
      return token;
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
      return null;
    }
  }

  Future<void> _setupInteractionHandler(BuildContext context) async {
    // Terminated state
    final initial = await _firebaseMessaging.getInitialMessage();
    if (initial != null) {
      _handleMessage(context, initial);
    }

    // Background → foreground
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessage(context, message);
    });
  }

  void _handleMessage(BuildContext context, RemoteMessage message) {
    debugPrint('Notification opened → data: ${message.data}');
    // Example: context.go('/some_route', extra: message.data);
  }

  void _listenTokenRefresh() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      debugPrint('FCM Token refreshed: $newToken');
      // Send new token to your backend if needed
    });
  }

  // Optional: for background handler (top-level function)
  static Future<void> showBackgroundNotification(RemoteMessage message) async {
    await NotificationServices.instance._showLocalNotificationFromMessage(message);
  }
}


String removeHtmlTags(String input) {
  String text = input;

  // Remove script/style blocks completely (common source of garbage)
  text = text.replaceAll(RegExp(r'<script[^>]*>[\s\S]*?</script>', caseSensitive: false), '');
  text = text.replaceAll(RegExp(r'<style[^>]*>[\s\S]*?</style>', caseSensitive: false), '');

  // Remove all remaining tags
  text = text.replaceAll(RegExp(r'<[^>]+>'), '');

  // Clean up whitespace
  text = text.replaceAll(RegExp(r'\s+'), ' ').trim();

  return text;
}

// String removeHtmlTags(String htmlString) {
//   if (htmlString.isEmpty) return '';

//   try {
//     final document = parser.parse(htmlString);
    
//     // Extract visible text (removes tags + scripts + styles)
//     final text = document.body?.text ?? document.documentElement?.text ?? '';
    
//     // Optional: normalize whitespace
//     return text.replaceAll(RegExp(r'\s+'), ' ').trim();
//   } catch (e) {
//     // Fallback in case of very broken HTML
//     return htmlString
//         .replaceAll(RegExp(r'<[^>]*>'), '')
//         .replaceAll(RegExp(r'\s+'), ' ')
//         .trim();
//   }
// }