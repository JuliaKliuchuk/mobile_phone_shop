class Basket {
  final int id;
  final String images;
  final int price;
  final String title;

  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  }) : super();

  Basket.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        images = json['images'],
        price = json['price'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'images': images,
        'price': price,
        'title': title,
      };
}
