import 'dart:convert';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  NotificationServices._(); // singleton pattern (optional but clean)

  static final NotificationServices instance = NotificationServices._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // ────────────────────────────────────────────────
  //  Fixed channel (create once - very important!)
  // ────────────────────────────────────────────────
  static const String _channelId = 'high_importance_channel';
  static const String _channelName = 'High Importance Notifications';
  static const String _channelDescription = 'Critical messages and alerts from the app';

  // ────────────────────────────────────────────────
  //  1. Request permissions (call once early in app)
  // ────────────────────────────────────────────────
  Future<void> requestNotificationPermissions() async {
    try {
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('Notification permission: GRANTED');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        debugPrint('Notification permission: PROVISIONAL');
      } else {
        debugPrint('Notification permission: DENIED');
        // Optional: guide user to settings
        await AppSettings.openAppSettings();
      }
    } catch (e) {
      debugPrint('Error requesting notification permission: $e');
    }
  }

  // ────────────────────────────────────────────────
  //  2. Initialize local notifications (call ONCE)
  // ────────────────────────────────────────────────
  Future<void> initializeLocalNotifications({
    required void Function(String? payload) onNotificationTap,
  }) async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        onNotificationTap(response.payload);
      },
    );

    // Create high-importance channel (Android 8+ requirement)
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      await androidPlugin?.createNotificationChannel(
        const AndroidNotificationChannel(
          _channelId,
          _channelName,
          description: _channelDescription,
          importance: Importance.max,
          playSound: true,
        ),
      );
    }
  }

  // ────────────────────────────────────────────────
  //  3. Handle foreground messages
  // ────────────────────────────────────────────────
  void setupForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground FCM → ${message.notification?.title ?? "no title"}');
      debugPrint('Body: ${message.notification?.body ?? "no body"}');
      debugPrint('Data: ${message.data}');

      // Show local notification (even on iOS in foreground)
      _showLocalNotification(message);
    });
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      playSound: true,
      enableVibration: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Use a stable ID or hash if you want to update existing notifications
    const notificationId = 0;

    await _notificationsPlugin.show(
      notificationId,
      notification.title ?? 'Message',
      notification.body ?? '',
      details,
      payload: jsonEncode(message.data), // proper JSON payload
    );
  }

  // ────────────────────────────────────────────────
  //  4. Handle notification tap (when app is opened)
  // ────────────────────────────────────────────────
  Future<void> setupInteractionHandler(BuildContext context) async {
    // App opened from terminated state via notification
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(context, initialMessage);
    }

    // App in background → user taps notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessage(context, message);
    });
  }

  void _handleMessage(BuildContext context, RemoteMessage message) {
    // ── Put your navigation / dialog logic here ──
    // Example:
    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat', arguments: message.data['chatId']);
    // }

    debugPrint('Notification tapped → ${message.data}');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Tapped: ${message.notification?.title}')),
    // );
  }

  // ────────────────────────────────────────────────
  //  5. Token management
  // ────────────────────────────────────────────────
  Future<String?> getFcmToken() async {
    try {
      return await _firebaseMessaging.getToken();
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
      return null;
    }
  }

  void listenTokenRefresh(void Function(String token) onNewToken) {
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      debugPrint('FCM Token refreshed: $newToken');
      onNewToken(newToken);
    });
  }

  // ────────────────────────────────────────────────
  //  Recommended usage (call these once in your app)
  // ────────────────────────────────────────────────
  Future<void> setupAll({
    required BuildContext context,
    required void Function(String? payload) onNotificationTap,
    required void Function(String token) onTokenRefresh,
  }) async {
    await requestNotificationPermissions();
    await initializeLocalNotifications(onNotificationTap: onNotificationTap);
    setupForegroundMessageHandler();
    await setupInteractionHandler(context);
    listenTokenRefresh(onTokenRefresh);

    // Optional: log initial token
    final token = await getFcmToken();
    if (token != null) {
      debugPrint('Current FCM Token: $token');
      // send to your backend here
    }
  }
}