import 'dart:core';
import 'package:flutter/material.dart';

class ProflePage extends StatefulWidget {
  const ProflePage({Key? key}) : super(key: key);

  @override
  State<ProflePage> createState() => _ProflePageState();
}

class _ProflePageState extends State<ProflePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            "This is Profle Page",
            style: TextStyle(fontSize: 24),
          ),
        )
      ],
    );
  }
}
