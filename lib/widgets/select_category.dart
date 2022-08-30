import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/category.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory(
      {Key? key, required this.model, required this.onSelected})
      : super(key: key);

  final ValueChanged<Category> onSelected;
  final Category model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            onSelected(model);
          },
          child: Column(
            children: <Widget>[
              model.isSelected
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 7.0),
                      alignment: Alignment.center,
                      width: 71,
                      height: 71,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.orange,
                      ),
                      child: SvgPicture.asset(
                        model.image,
                        height: 30,
                        color: CustomColors.white,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(bottom: 7.0),
                      alignment: Alignment.center,
                      width: 71,
                      height: 71,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.white,
                      ),
                      child: SvgPicture.asset(model.image,
                          height: 30, color: CustomColors.iconColor),
                    ),
              Text(
                model.name,
                style: TextStyle(
                  color: model.isSelected
                      ? CustomColors.orange
                      : CustomColors.darkBlue,
                  fontFamily: 'MarkPro',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
