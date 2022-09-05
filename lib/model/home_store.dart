class HomeStore {
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

  HomeStore.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        isNew = json['is_new'],
        title = json['title'],
        subtitle = json['subtitle'],
        picture = json['picture'],
        isBuy = json['is_buy'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'isNew': isNew,
        'title': title,
        'subtitle': subtitle,
        'picture': picture,
        'isBuy': isBuy,
      };
}
