import 'package:mobile_phone_shop/model/best_seller.dart';
import 'package:mobile_phone_shop/model/home_store.dart';

class StoreList {
  final List<HomeStore> homeStore;
  final List<BestSeller> bestSeller;

  const StoreList({
    required this.homeStore,
    required this.bestSeller,
  });

  static StoreList initial() {
    return const StoreList(
      homeStore: [],
      bestSeller: [],
    );
  }

  StoreList.fromJson(Map<String, dynamic> json)
      : homeStore = List<dynamic>.from(json['home_store'])
            .map((i) => HomeStore.fromJson(i))
            .toList(),
        bestSeller = List<dynamic>.from(json['best_seller'])
            .map((i) => BestSeller.fromJson(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'homeStore': homeStore.map((item) => item.toJson()).toList(),
        'bestSeller': bestSeller.map((item) => item.toJson()).toList(),
      };
}
