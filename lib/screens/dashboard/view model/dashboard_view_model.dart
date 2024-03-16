import 'package:flutter/material.dart';
import 'package:meat_mingle/screens/dashboard/model/dashboard_model.dart';
import 'package:meat_mingle/screens/dashboard/widgets/widgets.dart';

class DashboardModel extends ChangeNotifier {
  List<SelectedItems> get cartItems => itemList;
  int get length => cartItems.length;
  SelectedItems operator [](int index) => itemList[index];

  increment(SelectedItems selectedItems) {
    selectedItems.count++;
    selectedItems.totalPrice = selectedItems.count * selectedItems.price!;

    notifyListeners();
  }

  decrement(SelectedItems selectedItems) {
    selectedItems.count--;
    selectedItems.totalPrice = selectedItems.count * selectedItems.price!;
    notifyListeners();
  }

  int get totalPrice {
    int total = 0;
    for (var item in itemList) {
      total += item.totalPrice;
    }
    notifyListeners();
    return total;
  }
}
