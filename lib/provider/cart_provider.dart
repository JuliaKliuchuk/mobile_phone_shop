import 'dart:convert';

import 'package:mobile_phone_shop/model/cart.dart';
import 'package:http/http.dart' as http;

class CartProvider {
// get my cart
  Future<Cart> loadMyCart() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149'));
    if (response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
