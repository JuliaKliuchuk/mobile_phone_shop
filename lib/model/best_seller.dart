class BestSeller {
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

  BestSeller.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        isFavorites = json['is_favorites'],
        title = json['title'],
        priceWithoutDiscount = json['price_without_discount'],
        discountPrice = json['discount_price'],
        picture = json['picture'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'isFavorites': isFavorites,
        'title': title,
        'priceWithoutDiscount': priceWithoutDiscount,
        'discountPrice': discountPrice,
        'picture': picture,
      };
}
