import 'package:flutter/material.dart';

class AppColors {
  static const Color homeBackgroundColor = Color(0xffffffff);
  // static const Color primaryColor = Color(0xFF3366DD);
  static const Color primaryDarColor = Color(0xFF0B3558);

  static const Color primaryColor = Color(0xFF083F91);

  static const Color textSecondary = Color(0xff475069);
  static const Color textPrimary = Color(0xff121829);

  static const Color surfaceDarker = Color(0xffDBDDE3);

  static const Color tertiary = Color(0xff767E94);
  static const Color disabledColor = Color(0xffA8AEBF);
  //
  static const Color iconBack = Color(0xffF4F6FB);
  static const Color iconSecondary = Color(0xff61697F);
  static const Color extraLightBlue = Color(0xFFE7F6FF);
  static const Color successColor = Color(0xFF02523A);

  static const Color greenColor = Color(0xFF28A745);
  static const Color red = Color(0xffff0000);
  static const Color lightRed = Color(0xffFF4237);
  static const Color borderColor = Color(0xffA8AEBF);
  static const Color lightBlue = Color(0xff5298FB);
  static const Color deemBlue = Color(0xffCAD7F5);
  static const Color messageBoxText = Color(0xfff6f6f6);
  static const Color selectedBorderColor = Color(0xff3366DD);
  static const Color orangeColor = Color(0xFFFCB040);
  static const Color lightGrey = Color(0xFFB1AEB3);
  static const Color fontGrey = Color(0xff808080);
  static const Color secondaryColor = Color(0xffF5A303);
  static const Color lightFontGrey = Color(0xffB1AEB3);
  static const Color hintTextColor = Color(0xFFC4C4C4);
  static const Color searchHintTextColor = Color(0xFF9f9f9f);
  static const Color greyColor = Color(0xFF808080);
  static const Color buttonGreyColor = Color(0xFFc4c4c4);
  static const Color grey999Color = Color(0xff999999);
  static const Color grey777Color = Color(0xff777575);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color black2CColor = Color(0xff434343);
  static const Color headerBlack = Color(0xff252B36);
  static const Color lightRedColor = Color(0xffFFF8F8);
  static const Color onSurfaceDark = Color(0xff61697F);
  static const Color stickersRedColor = Color(0xffFF6161);
  static const Color ratingColor = Color(0xffFFAD49);
  static const Color ratingStarSecondColor = Color(0xffD2C7C8);
  static const Color containerBorder = Color(0xffECECEC);
  static const Color filterHeaderColor = Color(0xff252B36);
  static const Color lightPrimaryContainer = Color(0xffCCDBEF);

  // random colors
  static const Color random1 = Color(0xFFFBDEDE);
  static const Color random2 = Color(0xFFF8E5DC);
  static const Color random3 = Color(0xFFDBEAFF);
  static const Color random4 = Color(0xffFFE0E1);
}

// Light color scheme based on AppColors
final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  onPrimary: AppColors.whiteColor,
  primaryContainer: AppColors.extraLightBlue,
  onPrimaryContainer: AppColors.primaryColor,
  secondary: AppColors.secondaryColor,
  onSecondary: AppColors.whiteColor,
  secondaryContainer: AppColors.lightBlue,
  onSecondaryContainer: AppColors.primaryColor,
  tertiary: AppColors.orangeColor,
  onTertiary: AppColors.whiteColor,
  tertiaryContainer: AppColors.lightGrey,
  onTertiaryContainer: AppColors.blackColor,
  error: AppColors.red,
  errorContainer: AppColors.lightRedColor,
  onError: AppColors.whiteColor,
  onErrorContainer: AppColors.red,
  onBackground: AppColors.blackColor,
  surface: AppColors.whiteColor,
  onSurface: AppColors.blackColor,
  onSurfaceVariant: AppColors.greyColor,
  outline: AppColors.borderColor,
  shadow: AppColors.blackColor,
  inverseSurface: AppColors.black2CColor,
  onInverseSurface: AppColors.whiteColor,
  inversePrimary: AppColors.primaryColor,
  surfaceTint: AppColors.primaryColor,
  scrim: AppColors.blackColor,
);

// Dark color scheme based on AppColors
final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.primaryColor,
  onPrimary: AppColors.whiteColor,
  primaryContainer: AppColors.lightBlue,
  onPrimaryContainer: AppColors.whiteColor,
  secondary: AppColors.secondaryColor,
  onSecondary: AppColors.whiteColor,
  secondaryContainer: AppColors.deemBlue,
  onSecondaryContainer: AppColors.blackColor,
  tertiary: AppColors.orangeColor,
  onTertiary: AppColors.blackColor,
  tertiaryContainer: AppColors.lightGrey,
  onTertiaryContainer: AppColors.whiteColor,
  error: AppColors.red,
  errorContainer: AppColors.lightRedColor,
  onError: AppColors.whiteColor,
  onErrorContainer: AppColors.red,
  background: AppColors.black2CColor,
  onBackground: AppColors.whiteColor,
  surface: AppColors.blackColor,
  onSurface: AppColors.whiteColor,
  surfaceVariant: AppColors.greyColor,
  onSurfaceVariant: AppColors.lightGrey,
  outline: AppColors.borderColor,
  shadow: AppColors.blackColor,
  inverseSurface: AppColors.whiteColor,
  onInverseSurface: AppColors.blackColor,
  inversePrimary: AppColors.primaryColor,
  surfaceTint: AppColors.primaryColor,
  scrim: AppColors.blackColor,
);
