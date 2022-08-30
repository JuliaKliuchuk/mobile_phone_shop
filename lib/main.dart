import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/pages/main_page.dart';
import 'package:mobile_phone_shop/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => const MainPage()
  };

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const SplashPage(nextRoute: '/Home'),
    );
  }
}
