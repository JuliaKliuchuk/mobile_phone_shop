import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomTitleWidget(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomTextWidget(
            text: title,
          ),
          CustomTextWidget(
            text: subTitle,
            color: CustomColors.orange,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ],
      ),
    );
  }
}