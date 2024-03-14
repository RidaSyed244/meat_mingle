import 'package:flutter/material.dart';

class DashboardModel extends ChangeNotifier {
  int counter = 0;
  int producPprice = 0;
  int totalPrice = 0;
  increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }

  void totall() {
    totalPrice = counter * producPprice;
    notifyListeners();
  }
}
