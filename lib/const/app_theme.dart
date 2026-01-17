import 'package:baby_eduction/const/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemas.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: lightColorScheme.primary,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Color.fromARGB(255, 243, 243, 243),
      titleTextStyle: GoogleFonts.rubik(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xff121829),
      ),
      iconTheme: IconThemeData(color: lightColorScheme.primary),
    ),

    textTheme: GoogleFonts.rubikTextTheme().copyWith(
      headlineSmall: GoogleFonts.rubik(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Color(0xff121829),
      ),
      titleLarge: kTextStyle(),
      titleMedium: kkBoldTextStyle(),
      titleSmall: kBoldTextStyle(),
      bodyLarge: kkTextStyle(),
      bodyMedium: kBoldTextStyle(),
      bodySmall: sTextStyle(),
    ),

    // Bottom Navigation
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: lightColorScheme.primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.rubik(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.rubik(fontSize: 12),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: lightColorScheme.primary,
      indicatorColor: lightColorScheme.secondaryContainer,
      labelTextStyle: WidgetStateProperty.all(
        GoogleFonts.rubik(color: lightColorScheme.onPrimary, fontSize: 14),
      ),
    ),

    // Buttons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500),
        foregroundColor: lightColorScheme.primary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w600),
        foregroundColor: Colors.white,
        backgroundColor: lightColorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500),
        foregroundColor: lightColorScheme.primary,
        side: BorderSide(color: lightColorScheme.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // Popup Menu
    popupMenuTheme: PopupMenuThemeData(
      color: Colors.white,
      surfaceTintColor: lightColorScheme.onPrimary,
      textStyle: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: darkColorScheme.primary,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: const Color(0xff1A1A1A),

    // AppBar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: const Color(0xff333333),
      titleTextStyle: GoogleFonts.rubik(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    // Text Theme
    textTheme: GoogleFonts.rubikTextTheme().copyWith(
      headlineSmall: GoogleFonts.rubik(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.rubik(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
      ),
      bodySmall: GoogleFonts.rubik(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.surface,
      selectedItemColor: darkColorScheme.primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.rubik(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.rubik(fontSize: 12),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: darkColorScheme.primary,
      indicatorColor: darkColorScheme.secondaryContainer,
      labelTextStyle: WidgetStateProperty.all(
        GoogleFonts.rubik(color: darkColorScheme.onPrimary, fontSize: 14),
      ),
    ),

    // Buttons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500),
        foregroundColor: darkColorScheme.onPrimary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w600),
        foregroundColor: Colors.white,
        backgroundColor: darkColorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500),
        foregroundColor: darkColorScheme.onPrimary,
        side: BorderSide(color: darkColorScheme.onPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xff2C2C2C),
      surfaceTintColor: darkColorScheme.onPrimary,
      textStyle: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  );
}
