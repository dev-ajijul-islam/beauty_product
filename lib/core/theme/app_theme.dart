import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = _getLightTheme();
  static final ThemeData darkTheme = _getDarkTheme();

  static ThemeData _getLightTheme() {
    return ThemeData(
      brightness: .light,
      colorSchemeSeed: AppColors.primaryColor,
      filledButtonTheme: _getFilledButtonTheme(),
      iconButtonTheme: _getIconButtonTheme(),
      textTheme: _getTextTheme(),
      inputDecorationTheme: _getInputDecoration(),
    );
  }

  static ThemeData _getDarkTheme() {
    return ThemeData(
      brightness: .dark,
      colorSchemeSeed: AppColors.primaryColor,
      filledButtonTheme: _getFilledButtonTheme(),
      iconButtonTheme: _getIconButtonTheme(),
      textTheme: _getTextTheme(),
      inputDecorationTheme: _getInputDecoration(),
    );
  }

  //filled button theme data
  static FilledButtonThemeData _getFilledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(10)),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  // Icon button theme
  static IconButtonThemeData _getIconButtonTheme() {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
      ),
    );
  }

  // Text Theme
  static TextTheme _getTextTheme() {
    return TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.black54,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    );
  }

  // input decoration
  static InputDecorationThemeData _getInputDecoration() {
    return InputDecorationThemeData(
      filled: true,
      fillColor: AppColors.lightGrey,
      labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: .circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(10),
        borderSide: BorderSide.none,
      ),

    );
  }
}
