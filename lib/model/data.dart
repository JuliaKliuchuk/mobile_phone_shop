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
        name: "Phones",
        image: 'assets/icons/phone.svg',
        isSelected: false),
    Category(
        id: 6,
        name: "Computer",
        image: 'assets/icons/computer.svg',
        isSelected: false),
    Category(
        id: 7,
        name: "Health",
        image: 'assets/icons/health.svg',
        isSelected: false),
    Category(
        id: 8,
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
