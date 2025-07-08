import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

class AppTheme {
  static ThemeData morningTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.beige,
    cardColor: AppColors.primary.withOpacity(.5),
    textTheme: TextTheme(
      bodyLarge: AppStyle.text24.copyWith(color: AppColors.brown),
      bodyMedium: const TextStyle(
        color: AppColors.brownAccent,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brown,
        foregroundColor: AppColors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.brownOrange,   
      onPrimary: AppColors.white,       
    ),
  );

  static ThemeData nightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    cardColor: AppColors.navyBlue.withOpacity(.7),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.moonGlow,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.softPurple,
        foregroundColor: AppColors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.softPurple,    
      onPrimary: AppColors.white,    
      primaryFixed: AppColors.black,   
    ),
    
  );
}
