import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  bool isShowFilter = false;
  bool get filterValue => isShowFilter;

  void viewFilter() {
    isShowFilter = !isShowFilter;
    notifyListeners();
  }
}
