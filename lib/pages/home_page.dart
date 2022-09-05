import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/data.dart';
import 'package:mobile_phone_shop/provider/filter_provider.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/bootom_navigation_bar.dart';
import 'package:mobile_phone_shop/widgets/custom_titile_widget.dart';
import 'package:mobile_phone_shop/widgets/filter.dart';
import 'package:mobile_phone_shop/widgets/hot_sales_widget.dart';
import 'package:mobile_phone_shop/widgets/product_cart.dart';
import 'package:mobile_phone_shop/widgets/select_category.dart';
import 'package:mobile_phone_shop/widgets/select_location.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _appBar(FilterProvider filter) {
    return SizedBox(
      width: AppTheme.fullWidth(context),
      child: Row(
        children: <Widget>[
          const Spacer(),
          const SelectLocation(),
          const Spacer(),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              filter.viewFilter();
            },
            icon: filterIcon,
            color: AppColors.iconColor,
          ),
        ],
      ),
    );
  }

  Widget _productCategory() {
    return SizedBox(
      width: AppTheme.fullWidth(context),
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map(
              (category) => SelectCategory(
                category: category,
                onSelected: (model) {
                  setState(() {
                    for (var item in AppData.categoryList) {
                      item.isSelected = false;
                    }
                    category.isSelected = true;
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
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: AppColors.white,
              ),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: AppColors.orange)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: AppColors.orange,
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
        height: 520,
        child: const ProductCard());
  }

  Widget _serchFilter() {
    return SizedBox(
      width: AppTheme.fullWidth(context),
      child: const FilterWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    FilterProvider filter = Provider.of<FilterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        titleSpacing: 0.0,
        elevation: 0,
        title: _appBar(filter),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
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
              _productCategory(),
              _search(),
              const CustomTitleWidget(
                title: 'Hot sales',
                subTitle: 'see more',
              ),
              _hotSales(),
              Consumer<FilterProvider>(
                builder: (context, value, child) {
                  return filter.isShowFilter
                      ? _serchFilter()
                      : const SizedBox();
                },
              ),
              const CustomTitleWidget(
                title: 'Best Seller',
                subTitle: 'see more',
              ),
              _bestSellers(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
