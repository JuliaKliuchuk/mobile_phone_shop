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

  static Cart initial() {
    return Cart(
      id: '',
      basket: [],
      delivery: '',
      total: 0,
    );
  }

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
}
