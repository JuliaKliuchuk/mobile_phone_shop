import 'dart:core';
import 'package:flutter/material.dart';

// The same widget as SplashScreen, just give it another title
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Creation a widget state
class _HomeScreenState extends State<HomeScreen> {
  // Unlike SplashScreen add AppBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Home page',
            ),
          ],
        ),
      ),
    );
  }
}
