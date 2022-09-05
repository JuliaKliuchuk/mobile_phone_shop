import 'dart:convert';

import 'package:mobile_phone_shop/model/phone_detail.dart';
import 'package:http/http.dart' as http;

class PhoneDetailProvider {
  // get phone details
  Future<PhoneDetail> loadPhoneDetails() async {
    final response = await http.get(
      Uri.parse('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'),
    );
    if (response.statusCode == 200) {
      return PhoneDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
