import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';

class SplashPage extends StatefulWidget {
  final String nextRoute;

  const SplashPage({Key? key, required this.nextRoute}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 132,
                  height: 132,
                  margin: const EdgeInsets.only(left: 24.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orange,
                  ),
                ),
                Container(
                  width: 225,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 56.0, top: 40.0),
                  child: const Text(
                    "Ecommerce Concept",
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MarkPro',
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      letterSpacing: -0.33,
                      height: 1,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
