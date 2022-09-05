import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/data.dart';
import 'package:mobile_phone_shop/model/phone_detail.dart';
import 'package:mobile_phone_shop/pages/cart_page.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  static const star = Icon(
    Icons.star,
    color: Color.fromRGBO(255, 184, 0, 1),
    size: 24.0,
    semanticLabel: 'star',
  );

  Widget _button(
    String iconAsset, {
    Color iconColor = AppColors.white,
    double iconH = 10.0,
    double iconW = 10.0,
    Color buttonColor = AppColors.darkBlue,
    Function? onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 37,
      width: 37,
      child: FloatingActionButton(
        onPressed: () {
          onPressed!();
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
          const CustomTextWidget(
            text: 'Product Details',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          _button(
            'assets/icons/wallet.svg',
            iconColor: AppColors.white,
            iconH: 14.0,
            iconW: 13.64,
            buttonColor: AppColors.orange,
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => const CartPage());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }

  Widget _carusel(PhoneDetail data) {
    int count = data.images.length;

    return CarouselSlider.builder(
      itemCount: count,
      options: CarouselOptions(
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        height: 300,
        viewportFraction: 0.6,
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(55, 78, 136, 0.16),
                  offset: Offset(0, 10),
                  blurRadius: 20,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColors.white),
          child: Image.network(
            data.images[index],
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return child;
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _tabs(PhoneDetail data) {
    return SizedBox(
      height: 300,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            elevation: 0,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.orange,
                  labelColor: AppColors.darkBlue,
                  unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: 'MarkPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  labelStyle: TextStyle(
                    fontFamily: 'MarkPro',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      text: 'Shop',
                    ),
                    Tab(
                      text: 'Details',
                    ),
                    Tab(
                      text: 'Features',
                    ),
                  ],
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _tabShop(data),
              _tabDetails(),
              _tabFeatures(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabShop(PhoneDetail data) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: AppColors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _phoneParams(cpuIcon, data.CPU),
            _phoneParams(cameraIcon, data.camera),
            _phoneParams(ssdIcon, data.ssd),
            _phoneParams(sdIcon, data.sd),
          ],
        ),
        const SizedBox(height: 20),
        const CustomTextWidget(
          text: 'Select color and capacity',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _phoneColors(HexColor(data.color[0]), isSelected: true),
            _phoneColors(HexColor(data.color[1])),
            const Spacer(),
            _phoneCapasity(data.capacity[0], isSelected: true),
            _phoneCapasity(data.capacity[1]),
          ],
        ),
        GestureDetector(
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => const CartPage());
              Navigator.push(context, route);
            },
            child: Container(
              height: 54,
              width: AppTheme.fullWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomTextWidget(
                      text: 'Add to Cart',
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                    CustomTextWidget(
                      text: '\$1,500.00',
                      color: AppColors.white,
                      fontSize: 20,
                    )
                  ]),
            )),
      ]),
    );
  }

  Widget _phoneParams(Widget icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: icon,
        ),
        CustomTextWidget(
          text: text,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(183, 183, 183, 1),
        ),
      ],
    );
  }

  Widget _phoneColors(Color color, {bool isSelected = false}) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: isSelected
          ? const Icon(Icons.check, color: AppColors.white)
          : const Icon(null),
    );
  }

  Widget _phoneCapasity(String text, {bool isSelected = false}) {
    return isSelected
        ? Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            width: 70,
            height: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColors.orange,
            ),
            child: CustomTextWidget(
              text: '$text GB',
              color: AppColors.white,
              fontSize: 13,
            ),
          )
        : Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            width: 70,
            height: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColors.white,
            ),
            child: CustomTextWidget(
              text: '$text GB',
              color: AppColors.darkGrey,
              fontSize: 13,
            ),
          );
  }

  Widget _tabDetails() {
    return Center(
        child: Container(
      color: AppColors.white,
      child: const Text('Details'),
    ));
  }

  Widget _tabFeatures() {
    return Center(
        child: Container(
      color: AppColors.white,
      child: const Text('Features'),
    ));
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
        body: Consumer<PhoneDetail>(
          builder: (context, PhoneDetail phoneDetail, _) {
            return Column(
              children: [
                Expanded(
                  child: phoneDetail.images.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                // alignment: Alignment.topCenter,
                                height: 350,
                                padding: const EdgeInsets.only(top: 10),
                                child: _carusel(phoneDetail),
                              ),
                              Container(
                                height: 430,
                                width: AppTheme.fullWidth(context),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(75, 94, 143, 0.1),
                                        offset: Offset(0, -5),
                                        blurRadius: 20)
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          text: phoneDetail.title,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                        ),
                                        _button(
                                          'assets/icons/favorite.svg',
                                          iconColor: AppColors.white,
                                          iconH: 13.0,
                                          iconW: 14.0,
                                          buttonColor: AppColors.darkBlue,
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        star,
                                        star,
                                        star,
                                        star,
                                        star
                                      ],
                                    ),
                                    _tabs(phoneDetail)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ],
            );
          },
        ));
  }
}
