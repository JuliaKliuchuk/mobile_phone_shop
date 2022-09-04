import 'package:flutter/material.dart';

class CustomColors {
  static const Color background = Color.fromRGBO(248, 248, 248, 1);
  static const Color iconColor = Color.fromRGBO(179, 179, 195, 1);

  static const Color orange = Color.fromRGBO(255, 110, 78, 1);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color darkBlue = Color.fromRGBO(1, 0, 53, 1);
  static const Color lightGrey = Color.fromRGBO(204, 204, 204, 1);
}

// convert Hex color
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
