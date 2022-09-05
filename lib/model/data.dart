import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/model/category.dart';

class FilterOptions {
  String title;
  String value;
  FilterOptions({required this.title, required this.value});
}

class AppData {
  static List<Category> categoryList = [
    Category(
        id: 1,
        name: "Phones",
        image: 'assets/icons/phone.svg',
        isSelected: true),
    Category(
        id: 2,
        name: "Computer",
        image: 'assets/icons/computer.svg',
        isSelected: false),
    Category(
        id: 3,
        name: "Health",
        image: 'assets/icons/health.svg',
        isSelected: false),
    Category(
        id: 4,
        name: "Books",
        image: 'assets/icons/books.svg',
        isSelected: false),
    Category(
        id: 5,
        name: "Health",
        image: 'assets/icons/health.svg',
        isSelected: false),
    Category(
        id: 6,
        name: "Books",
        image: 'assets/icons/books.svg',
        isSelected: false),
  ];

  static List<FilterOptions> filterOptionsList = [
    FilterOptions(title: "Brand", value: 'Samsung'),
    FilterOptions(title: "Price", value: '\$300-\$500'),
    FilterOptions(title: "Size", value: '4.5 to 5.5 inches'),
  ];
}

final Widget placeIcon = SvgPicture.asset('assets/icons/place.svg');
final Widget filterIcon = SvgPicture.asset('assets/icons/filter.svg');
final Widget cpuIcon = SvgPicture.asset('assets/icons/cpu.svg');
final Widget cameraIcon = SvgPicture.asset('assets/icons/camera.svg');
final Widget ssdIcon = SvgPicture.asset('assets/icons/ssd.svg');
final Widget sdIcon = SvgPicture.asset('assets/icons/sd.svg');
final Widget walletIcon = SvgPicture.asset('assets/icons/wallet.svg');
final Widget favoriteIcon = SvgPicture.asset('assets/icons/favorite.svg');
final Widget profileIcon = SvgPicture.asset('assets/icons/profile.svg');
final Widget cartIcon = SvgPicture.asset('assets/icons/cart.svg');
