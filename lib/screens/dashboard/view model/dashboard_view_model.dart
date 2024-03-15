import 'package:flutter/material.dart';
import 'package:meat_mingle/screens/dashboard/model/dashboard_model.dart';

class DashboardModel extends ChangeNotifier {
  increment(SelectedItems selectedItems) {
    selectedItems.count++;
    notifyListeners();
  }

  void decrement(SelectedItems selectedItems) {
    selectedItems.count--;
    notifyListeners();
  }

  // void totall() {
  //   notifyListeners();
  // }
}
