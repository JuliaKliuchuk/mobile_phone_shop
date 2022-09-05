import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/model/cart.dart';
import 'package:mobile_phone_shop/model/phone_detail.dart';
import 'package:mobile_phone_shop/model/store_list.dart';
import 'package:mobile_phone_shop/pages/main_page.dart';
import 'package:mobile_phone_shop/provider/cart_provider.dart';
import 'package:mobile_phone_shop/provider/filter_provider.dart';
import 'package:mobile_phone_shop/provider/product_detail_provider.dart';
import 'package:mobile_phone_shop/provider/store_list_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          FutureProvider<StoreList>(
            initialData: StoreList.initial(),
            create: (_) async => HomeProvider().loadStoreList(),
          ),
          ChangeNotifierProvider<FilterProvider>.value(value: FilterProvider()),
          FutureProvider<PhoneDetail>(
            initialData: PhoneDetail.initial(),
            create: (_) async => PhoneDetailProvider().loadPhoneDetails(),
          ),
          FutureProvider<Cart>(
            initialData: Cart.initial(),
            create: (_) async => CartProvider().loadMyCart(),
          ),
        ],
        child: const MainPage(),
      ),
    );
  }
}
