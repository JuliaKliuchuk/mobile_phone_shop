import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/pages/home_page.dart';
import 'package:mobile_phone_shop/pages/splash_page.dart';

// Application launch
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => HomeScreen(title: 'EVILEG')
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVILEG',
      home: SplashScreen(nextRoute: '/Home'),
      routes: routes,
    );
  }
}
