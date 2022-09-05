class PhoneDetail {
  final String id;
  // ignore: non_constant_identifier_names
  final String CPU;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  PhoneDetail({
    required this.id,
    // ignore: non_constant_identifier_names
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

  static PhoneDetail initial() {
    return PhoneDetail(
      id: '',
      CPU: '',
      camera: '',
      capacity: [],
      color: [],
      images: [],
      isFavorites: true,
      price: 0,
      rating: 0.0,
      sd: '',
      ssd: '',
      title: '',
    );
  }

  factory PhoneDetail.fromJson(Map<String, dynamic> json) {
    var capacityFromJson = json['capacity'];
    var colorFromJson = json['color'];
    var imagesFromJson = json['images'];

    List<String> capacityList = capacityFromJson.cast<String>();
    List<String> colorList = colorFromJson.cast<String>();
    List<String> imagesList = imagesFromJson.cast<String>();

    return PhoneDetail(
      id: json['id'],
      CPU: json['CPU'],
      camera: json['camera'],
      capacity: capacityList,
      color: colorList,
      images: imagesList,
      isFavorites: json['isFavorites'],
      price: json['price'],
      rating: json['rating'],
      sd: json['sd'],
      ssd: json['ssd'],
      title: json['title'],
    );
  }
}
