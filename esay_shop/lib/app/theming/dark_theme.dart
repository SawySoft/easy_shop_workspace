import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDarkTheme {
  static final ThemeData theme = ThemeData(
    // General
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    // Color Scheme
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.orange,
      surface: AppColors.backgroundDarkIcon,
      secondaryContainer: AppColors.fillDark,
      error: AppColors.red,
      primaryContainer: AppColors.backgroundDark,
      tertiary: AppColors.textDark,
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.orange,
        foregroundColor: AppColors.white,
        minimumSize: const Size(300, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      hintStyle: const TextStyle(color: AppColors.disableDark, fontSize: 14, fontWeight: FontWeight.w400),
      labelStyle: const TextStyle(color: AppColors.disableDark, fontSize: 14, fontWeight: FontWeight.w500),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.disableDark, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.disableDark, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.orange, width: 1.7),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.red, width: 1.7),
      ),
    ),

    // Text Theme
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 9, color: AppColors.textDark),
      titleSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.white),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.white),
      bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDark),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textDark),
      displaySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textDark),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textDark),
      displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: AppColors.textDark),
      headlineSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.disableDark),
      headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.disableDark),
      headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.disableDark),
    ),
  );
}
