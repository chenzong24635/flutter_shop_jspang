import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
  void reduce() {
    _count--;
    notifyListeners();
  }
}
class Price with ChangeNotifier {
  int _price = 0;
  int get getPrice => _price;

  void increment() {
    _price++;
    notifyListeners();
  }
  void reduce() {
    _price--;
    notifyListeners();
  }
}


