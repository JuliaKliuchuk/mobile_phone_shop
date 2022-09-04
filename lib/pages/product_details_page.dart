import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/phone.dart';
import 'package:mobile_phone_shop/services/http_service.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';
import 'package:mobile_phone_shop/widgets/extentions.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  late Future<PhoneDetails> fetchPhoneDetail;
  late final ValueChanged onSelected;
  static bool isSelect = false;

  static const star = Icon(
    Icons.star,
    color: Color.fromRGBO(255, 184, 0, 1),
    size: 24.0,
    semanticLabel: 'star',
  );

  @override
  void initState() {
    super.initState();
    fetchPhoneDetail = fetchPhoneDetails();
  }

  Widget _icon(
    IconData icon, {
    Color iconColor = CustomColors.iconColor,
    Color buttonColor = CustomColors.iconColor,
    Function? onPressed,
  }) {
    return Container(
      height: 37,
      width: 37,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Icon(icon, color: iconColor, size: 15),
    ).ripple(
      () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }

  Widget _appBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(Icons.chevron_left,
              iconColor: CustomColors.white,
              buttonColor: CustomColors.darkBlue, onPressed: () {
            Navigator.pop(context);
          }),
          const CustomTextWidget(
            text: 'Product Details',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          _icon(
            Icons.shopping_bag_outlined,
            iconColor: CustomColors.white,
            buttonColor: CustomColors.orange,
          ),
        ],
      ),
    );
  }

  Widget _carusel(PhoneDetails data) {
    int count = data.images.length;
    return CarouselSlider.builder(
      itemCount: count,
      options: CarouselOptions(
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        aspectRatio: 1.2,
        viewportFraction: 0.7,
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(55, 78, 136, 0.16),
                  offset: Offset(0, 0),
                  blurRadius: 20)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              image: NetworkImage('${data.images[index]}'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _tabs(PhoneDetails data) {
    return SizedBox(
      height: 330,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: CustomColors.white,
            elevation: 0,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                TabBar(
                  isScrollable: true,
                  indicatorColor: CustomColors.orange,
                  labelColor: CustomColors.darkBlue,
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

  Widget _tabShop(PhoneDetails data) {
    final Widget cpuIcon = SvgPicture.asset('assets/icons/cpu.svg');
    final Widget cameraIcon = SvgPicture.asset('assets/icons/camera.svg');
    final Widget ssdIcon = SvgPicture.asset('assets/icons/ssd.svg');
    final Widget sdIcon = SvgPicture.asset('assets/icons/sd.svg');

    return Container(
      padding: const EdgeInsets.only(top: 20),
      // color: CustomColors.white,
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
            SizedBox(
              height: 40,
              width: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data.color
                    .map<Widget>((color) => _phoneColors(HexColor(color)))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data.capacity
                    .map<Widget>((text) => _phoneCapasity(text))
                    .toList(),
              ),
            ),
          ],
        ),
        Container(
          height: 54,
          width: AppTheme.fullWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            color: CustomColors.orange,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomTextWidget(
                  text: 'Add to Cart',
                  color: CustomColors.white,
                  fontSize: 20,
                ),
                CustomTextWidget(
                  text: '\$1,500.00',
                  color: CustomColors.white,
                  fontSize: 20,
                )
              ]),
        )
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

  Widget _phoneColors(Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: const Icon(
            Icons.check,
            color: CustomColors.white,
          ),
        ),
      ],
    );
  }

  Widget _phoneCapasity(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: 70,
          height: 30,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: CustomColors.orange,
          ),
          child: CustomTextWidget(
            text: '$text GB',
            color: CustomColors.white,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _tabDetails() {
    return Center(
      child: const Text('Details'),
    );
  }

  Widget _tabFeatures() {
    return Center(
      child: const Text('Features'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.background,
          titleSpacing: 0.0,
          elevation: 0,
          title: _appBar(),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            color: CustomColors.background,
            margin: const EdgeInsets.only(top: 20),
            child: FutureBuilder<PhoneDetails>(
              future: fetchPhoneDetail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350,
                          child: _carusel(snapshot.data as PhoneDetails),
                        ),
                        Container(
                          height: 470,
                          width: AppTheme.fullWidth(context),
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: const BoxDecoration(
                            color: CustomColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                    text: '${snapshot.data?.title}',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                  _icon(
                                    Icons.favorite_border_outlined,
                                    iconColor: CustomColors.white,
                                    buttonColor: CustomColors.darkBlue,
                                  ),
                                ],
                              ),
                              Row(
                                children: const [star, star, star, star, star],
                              ),
                              _tabs(snapshot.data as PhoneDetails)
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}
