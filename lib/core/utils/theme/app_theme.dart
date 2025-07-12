import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
class AppTheme {
  static ThemeData morningTheme = ThemeData(
    brightness: Brightness.light,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppColors.brownOrange,
    ),
    cardTheme: const CardTheme(
      color: AppColors.beige,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: AppColors.teracotta),
      ),
    ),
    scaffoldBackgroundColor: AppColors.primary.withOpacity(.4),
    cardColor: AppColors.primary.withOpacity(.5),
    textTheme: TextTheme(
      bodyLarge: AppStyle.text24.copyWith(color: AppColors.brown),
      bodySmall: AppStyle.text16.copyWith(color: AppColors.brownAccent),
      bodyMedium: const TextStyle(
        color: AppColors.brownAccent,
        fontSize: 16,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: AppStyle.text16.copyWith(color: AppColors.brown),
        unselectedLabelStyle: AppStyle.text16.copyWith(color: AppColors.salmon),
        selectedIconTheme: const IconThemeData(color: AppColors.brownAccent),
        unselectedIconTheme: const IconThemeData(color: AppColors.salmon)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brownOrange,
        foregroundColor: AppColors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.brownOrange,
      onPrimary: AppColors.white,
    ),
  );

  static ThemeData nightTheme = ThemeData(
    brightness: Brightness.dark,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppColors.purble,
    ),
    scaffoldBackgroundColor: AppColors.darkBlue,
    cardTheme: CardTheme(
      color: AppColors.moonGlow.withOpacity(.95),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: AppColors.lavenderGlow),
      ),
    ),
    cardColor: AppColors.navyBlue.withOpacity(.95),
    textTheme: TextTheme(
      bodyLarge:
          AppStyle.text24.copyWith(color: AppColors.lavenderGlow, fontSize: 27),
      bodySmall: AppStyle.text16.copyWith(color: AppColors.white),
      bodyMedium:
          AppStyle.text24.copyWith(color: AppColors.purble, fontSize: 20),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: null,
        unselectedItemColor: null,
        selectedLabelStyle: AppStyle.text16.copyWith(color: AppColors.moonGlow),
        unselectedLabelStyle:
            AppStyle.text16.copyWith(color: AppColors.softPurple),
        selectedIconTheme: const IconThemeData(
          color: AppColors.lavenderGlow,
        ),
        unselectedIconTheme: const IconThemeData(color: AppColors.moonGlow)),
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
