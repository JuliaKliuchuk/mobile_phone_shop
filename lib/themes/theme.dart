import 'package:flutter/material.dart';

import 'custom_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    backgroundColor: CustomColors.background,
    primaryColor: CustomColors.background,
    cardTheme: const CardTheme(
      color: CustomColors.background,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: CustomColors.darkBlue,
      ),
    ),
    iconTheme: const IconThemeData(
      color: CustomColors.iconColor,
    ),
    bottomAppBarColor: CustomColors.background,
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: CustomColors.darkBlue,
      ),
    ),
  );

  static TextStyle titleStyle = const TextStyle(
    color: CustomColors.darkBlue,
    fontSize: 25,
    fontFamily: 'MarkPro',
    fontWeight: FontWeight.w700,
  );

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10);

  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
