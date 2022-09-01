import 'package:mobile_phone_shop/model/interfaces/json_converter.dart';

class HomeStore implements IJsonConverter {
  final int id;
  final bool? isNew;
  final String title;
  final String? subtitle;
  final String? picture;
  final bool isBuy;

  HomeStore({
    required this.id,
    this.isNew,
    required this.title,
    this.subtitle,
    this.picture,
    required this.isBuy,
  }) : super();

  @override
  factory HomeStore.fromJson(Map<String, dynamic> json) {
    return HomeStore(
      id: json['id'],
      isNew: json['is_new'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      isBuy: json['is_buy'],
    );
  }
}
