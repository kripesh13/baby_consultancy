import 'package:baby_eduction/views/auth/login/login_screen.dart';
import 'package:baby_eduction/views/document/add_document_screen.dart';
import 'package:baby_eduction/views/nav_bar/nav_bar_screen.dart';
import 'package:baby_eduction/views/splash/splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

class AppRouter {
  static Widget transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.linear)),
      ),
      child: child,
    );
  }

  static final GoRouter router = GoRouter(
    observers: [BotToastNavigatorObserver()],
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SplashScreen(),
          transitionsBuilder: transitionsBuilder,
        ),
      ),

      GoRoute(
        path: RouteNames.navBraScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: NavBarScreen(),
          transitionsBuilder: transitionsBuilder,
        ),
      ),

      GoRoute(
        path: RouteNames.loginScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: LoginScreen(),
          transitionsBuilder: transitionsBuilder,
        ),
      ),

      GoRoute(
        path: RouteNames.documentUploadScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: DocumentUploadScreen(),
          transitionsBuilder: transitionsBuilder,
        ),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("Look who is here,"), Text("A HACKER,")],
        ),
      ),
    ),
  );
}
