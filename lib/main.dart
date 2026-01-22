import 'package:baby_eduction/const/app_theme.dart';
import 'package:baby_eduction/const/design_constant.dart';
import 'package:baby_eduction/routes/app_router.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

/// main dart ????

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(deviceWidth, deviceHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          title: 'Baby Education',
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          routerConfig: AppRouter.router,
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
