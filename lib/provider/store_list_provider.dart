import 'dart:convert';

import 'package:mobile_phone_shop/model/store_list.dart';
import 'package:http/http.dart' as http;

class HomeProvider {
  // get Hot sales & Best Seller
  Future<StoreList> loadStoreList() async {
    final response = await http.get(
      Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'),
    );
    if (response.statusCode == 200) {
      return StoreList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
