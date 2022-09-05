import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  final String? subTitle;

  const CustomTitleWidget({Key? key, required this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          CustomTextWidget(
            text: title,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: CustomTextWidget(
              text: subTitle ?? '',
              color: AppColors.orange,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
