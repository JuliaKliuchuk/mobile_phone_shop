import 'package:mobile_phone_shop/model/best_seller.dart';
import 'package:mobile_phone_shop/model/home_store.dart';

import 'interfaces/json_converter.dart';

class StoreList {
  final List<HomeStore> homeStore;
  final List<BestSeller> bestSeller;

  const StoreList({
    required this.homeStore,
    required this.bestSeller,
  });

  factory StoreList.fromJson(Map<String, dynamic> json) {
    return StoreList(
      homeStore: StoreList.fromJsonList<HomeStore>(
          json['home_store'], HomeStore.fromJson),
      bestSeller: StoreList.fromJsonList<BestSeller>(
          json['best_seller'], BestSeller.fromJson),
    );
  }

  static List<T> fromJsonList<T extends IJsonConverter>(
      List<dynamic> json, T Function(Map<String, dynamic>) creator) {
    List<T> result = <T>[];

    for (var elem in json) {
      result.add(creator(elem));
    }

    return result;
  }
}
