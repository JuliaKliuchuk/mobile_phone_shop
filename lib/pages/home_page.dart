import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/data.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/custom_titile_widget.dart';
import 'package:mobile_phone_shop/widgets/hot_sales_widget.dart';
import 'package:mobile_phone_shop/widgets/product_cart.dart';
import 'package:mobile_phone_shop/widgets/select_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _categoryWidget() {
    return SizedBox(
      width: AppTheme.fullWidth(context),
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map(
              (category) => SelectCategory(
                model: category,
                onSelected: (model) {
                  setState(() {
                    for (var item in AppData.categoryList) {
                      item.isSelected = false;
                    }
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _search() {
    final Widget searchFilterIcon =
        SvgPicture.asset('assets/icons/search_filter.svg');

    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: CustomColors.white,
              ),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: CustomColors.orange)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: CustomColors.orange,
            ),
            child: IconButton(
              iconSize: 15.0,
              enableFeedback: false,
              onPressed: () {},
              icon: searchFilterIcon,
              padding: const EdgeInsets.all(5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hotSales() {
    return SizedBox(
        width: AppTheme.fullWidth(context),
        height: 182,
        child: const HotSalesWidget());
  }

  Widget _bestSellers() {
    return SizedBox(
        width: AppTheme.fullWidth(context),
        height: 500,
        child: const ProductCardWidget());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const CustomTitleWidget(
              title: 'Select Category',
              subTitle: 'view all',
            ),
            _categoryWidget(),
            _search(),
            const CustomTitleWidget(
              title: 'Hot sales',
              subTitle: 'see more',
            ),
            _hotSales(),
            const CustomTitleWidget(
              title: 'Best Seller',
              subTitle: 'see more',
            ),
            _bestSellers(),
          ],
        ),
      ),
    );
  }
}
