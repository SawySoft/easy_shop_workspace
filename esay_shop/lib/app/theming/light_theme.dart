import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppLightTheme {
  static final ThemeData theme = ThemeData(
    // General
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: AppColors.backgroundGrey,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // Color Scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.orange,
      surface: AppColors.backgroundLightIcon,
      secondaryContainer: AppColors.fillLight,
      error: AppColors.red,
        primaryContainer: AppColors.backgroundLight,
      tertiary: AppColors.textLight,
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.disableLight, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.disableLight, width: 1.5),
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
      bodySmall: TextStyle(fontSize: 9, color: AppColors.textLight),
      titleSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.white),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),
      bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textLight),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textLight),
      displaySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textLight),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textLight),
      displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: AppColors.textLight),
      headlineSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primaryLight),
      headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primaryLight),
      headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primaryLight),
    ),
  );
}
