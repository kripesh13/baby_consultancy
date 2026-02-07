import 'dart:convert';

import 'package:baby_eduction/const/app_theme.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/network/notification_service.dart';
import 'package:baby_eduction/routes/app_router.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );


  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}



@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  try {
    if (message.notification != null) {
      print(message.notification!.body);
    }
  } catch (e) {
    print('Error handling background message: $e');
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationServices.instance.setupAll(
        context: context,
        onNotificationTap: (payload) {
          if (payload != null) {
            final data = jsonDecode(payload);
            debugPrint('Notification tapped: $data');

            // Example navigation
            // navigatorKey.currentState?.pushNamed('/details');
          }
        },
        onTokenRefresh: (token) {
          debugPrint('New FCM Token: $token');
          // send token to backend
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(deviceWidth, deviceHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Baby Education',
          // showPerformanceOverlay: true,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          routerConfig: AppRouter.router,
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
