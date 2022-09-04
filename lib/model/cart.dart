import 'package:mobile_phone_shop/model/basket.dart';

class Cart {
  final String id;
  final List<Basket> basket;
  final String delivery;
  final int total;

  Cart({
    required this.id,
    required this.basket,
    required this.delivery,
    required this.total,
  }) : super();

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        delivery = json['delivery'],
        total = json['total'],
        basket = List<dynamic>.from(json['basket'])
            .map((i) => Basket.fromJson(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'delivery': delivery,
        'total': total,
        'basket': basket.map((item) => item.toJson()).toList(),
      };

  // @override
  // factory Cart.fromJson(Map<String, dynamic> json) {
  //   return Cart(
  //     id: json['id'],
  //     delivery: json['delivery'],
  //     total: json['total'],
  //     basket: Cart.fromJsonList<Basket>(json['basket'], Basket.fromJson),
  //   );
  // }

  // static List<T> fromJsonList<T extends IJsonConverter>(
  //     List<dynamic> json, T Function(Map<String, dynamic>) creator) {
  //   List<T> result = <T>[];

  //   for (var elem in json) {
  //     result.add(creator(elem));
  //   }

  //   return result;
  // }
}
