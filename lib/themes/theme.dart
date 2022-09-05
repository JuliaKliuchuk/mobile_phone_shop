import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    backgroundColor: AppColors.background,
    primaryColor: AppColors.background,
    cardTheme: const CardTheme(
      color: AppColors.background,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkBlue,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.iconColor,
    ),
    bottomAppBarColor: AppColors.darkBlue,
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkBlue,
      ),
    ),
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
