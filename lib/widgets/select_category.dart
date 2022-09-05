import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/category.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory(
      {Key? key, required this.category, required this.onSelected})
      : super(key: key);

  final ValueChanged<Category> onSelected;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            onSelected(category);
          },
          child: Column(
            children: <Widget>[
              category.isSelected
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 7.0),
                      alignment: Alignment.center,
                      width: 71,
                      height: 71,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orange,
                      ),
                      child: SvgPicture.asset(
                        category.image,
                        height: 30,
                        color: AppColors.white,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(bottom: 7.0),
                      alignment: Alignment.center,
                      width: 71,
                      height: 71,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: SvgPicture.asset(category.image,
                          height: 30, color: AppColors.iconColor),
                    ),
              Text(
                category.name,
                style: TextStyle(
                  color: category.isSelected
                      ? AppColors.orange
                      : AppColors.darkBlue,
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
