import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/pages/home_page.dart';
import 'package:mobile_phone_shop/pages/splash_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final routes = <String, WidgetBuilder>{
    '/HomePage': (BuildContext context) => const HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      home: const SplashPage(nextRoute: '/HomePage'),
    );
  }
}
