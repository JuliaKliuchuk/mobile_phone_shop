class PhoneDetails {
  final String id;
  final String CPU;
  final String camera;
  final List<dynamic> capacity;
  final List<dynamic> color;
  final List<dynamic> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  PhoneDetails({
    required this.id,
    required this.CPU,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  }) : super();

  @override
  factory PhoneDetails.fromJson(Map<String, dynamic> json) {
    return PhoneDetails(
      id: json['id'],
      CPU: json['CPU'],
      camera: json['camera'],
      capacity: json['capacity'],
      color: json['color'],
      images: json['images'],
      isFavorites: json['isFavorites'],
      price: json['price'],
      rating: json['rating'],
      sd: json['sd'],
      ssd: json['ssd'],
      title: json['title'],
    );
  }
}
