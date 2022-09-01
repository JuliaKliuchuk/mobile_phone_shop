import 'package:mobile_phone_shop/model/interfaces/json_converter.dart';

class BestSeller implements IJsonConverter {
  final int id;
  final bool isFavorites; // is_favorites
  final String title;
  final int priceWithoutDiscount; // price_without_discount
  final int discountPrice; // discount_price
  final String picture;

  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  }) : super();

  factory BestSeller.fromJson(Map<String, dynamic> json) {
    return BestSeller(
      id: json['id'],
      isFavorites: json['is_favorites'],
      title: json['title'],
      priceWithoutDiscount: json['price_without_discount'],
      discountPrice: json['discount_price'],
      picture: json['picture'],
    );
  }
}
