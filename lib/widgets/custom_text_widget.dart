import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomTextWidget(
      {Key? key,
      required this.text,
      this.fontFamily = 'MarkPro',
      this.fontSize = 25,
      this.color = CustomColors.darkBlue,
      this.fontWeight = FontWeight.w700})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}