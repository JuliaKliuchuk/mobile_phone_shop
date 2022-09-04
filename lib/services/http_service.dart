import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_phone_shop/model/phone.dart';
import '../model/store_list.dart';

// get Hot sales & Best Seller
Future<StoreList> fetchStoreList() async {
  final response = await http.get(Uri.parse(
      'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'));

  if (response.statusCode == 200) {
    return StoreList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

// get phone details
Future<PhoneDetails> fetchPhoneDetails() async {
  final response = await http.get(Uri.parse(
      'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'));
  if (response.statusCode == 200) {
    return PhoneDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
