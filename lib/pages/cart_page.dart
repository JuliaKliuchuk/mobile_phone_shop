import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/cart.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';
import '../model/basket.dart';
import '../themes/theme.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget _button(
    String iconAsset, {
    Color iconColor = AppColors.white,
    double iconH = 10.0,
    double iconW = 10.0,
    Color buttonColor = AppColors.darkBlue,
    Function? onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 37,
      width: 37,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        elevation: 0,
        backgroundColor: buttonColor,
        foregroundColor: iconColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SvgPicture.asset(
          iconAsset,
          color: iconColor,
          width: iconH,
          height: iconH,
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _button(
            'assets/icons/back.svg',
            iconColor: AppColors.white,
            iconH: 14.0,
            iconW: 7.0,
            buttonColor: AppColors.darkBlue,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          const CustomTextWidget(
            text: 'Add address',
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          _button(
            'assets/icons/place.svg',
            iconColor: AppColors.white,
            iconH: 17.0,
            iconW: 14.0,
            buttonColor: AppColors.orange,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _basketItem(Basket data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: AppTheme.fullWidth(context),
      height: 88,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(data.images),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 153,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomTextWidget(
                    text: data.title,
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomTextWidget(
                  text: '\$${data.price}.00',
                  color: AppColors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            margin: const EdgeInsets.only(left: 10),
            width: 26,
            height: 68,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(40, 40, 67, 1),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  child: SvgPicture.asset('assets/icons/minus.svg'),
                ),
                const SizedBox(
                    child: CustomTextWidget(
                  text: '2',
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
                SizedBox(
                  child: SvgPicture.asset('assets/icons/plus.svg'),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/delete.svg',
                width: 14.75,
                height: 16,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        titleSpacing: 0.0,
        elevation: 0,
        title: _appBar(),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: const CustomTextWidget(
                text: 'My Cart',
                fontSize: 35,
              ),
            ),
            Container(
              height: 595,
              width: AppTheme.fullWidth(context),
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(75, 94, 143, 0.1),
                      offset: Offset(0, -5),
                      blurRadius: 20)
                ],
              ),
              child: Consumer<Cart>(
                builder: (context, Cart cart, _) {
                  return Column(
                    children: [
                      Expanded(
                          child: cart.basket.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : Column(
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: cart.basket
                                            .map((item) => _basketItem(item))
                                            .toList(),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Divider(
                                      thickness: 2,
                                      endIndent: 0,
                                      indent: 0,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.25),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Table(
                                        columnWidths: const {
                                          0: FlexColumnWidth(),
                                          1: FixedColumnWidth(100.00),
                                        },
                                        children: [
                                          TableRow(children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              child: const CustomTextWidget(
                                                text: 'Total',
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: CustomTextWidget(
                                                text: '\$${cart.total} us',
                                                color: AppColors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            const SizedBox(
                                              height: 30,
                                              child: CustomTextWidget(
                                                text: 'Delivery',
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: CustomTextWidget(
                                                text: cart.delivery,
                                                color: AppColors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      endIndent: 0,
                                      indent: 0,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.25),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(20),
                                      width: AppTheme.fullWidth(context),
                                      child: FloatingActionButton(
                                          onPressed: () {},
                                          elevation: 0,
                                          backgroundColor: AppColors.orange,
                                          foregroundColor: AppColors.white,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: const CustomTextWidget(
                                            text: 'Checkout',
                                            fontSize: 20,
                                            color: AppColors.white,
                                          )),
                                    )
                                  ],
                                )),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
