import 'package:flutter/material.dart';
import 'package:meat_mingle/screens/dashboard/model/dashboard_model.dart';
import 'package:meat_mingle/screens/dashboard/widgets/widgets.dart';

class DashboardModel extends ChangeNotifier {
  List<SelectedItems> allCartItems = [];
  List<SelectedItems> get cartItems => itemList;
  int get length => cartItems.length;
  SelectedItems operator [](int index) => itemList[index];
  addToCart(SelectedItems item) {
    final existingProductIndex = allCartItems.indexWhere(
      (element) =>
          element.name == element.name &&
          element.price == element.price &&
          element.count == element.count &&
          element.totalPrice == element.totalPrice,
    );
    if (existingProductIndex != -1) {
      final existingProduct = allCartItems[existingProductIndex];
      existingProduct.count++;
      existingProduct.totalPrice =
          existingProduct.price! * existingProduct.count;
      final updatedProducts = List<SelectedItems>.from(allCartItems);
      updatedProducts[existingProductIndex] = existingProduct;
      allCartItems = updatedProducts;
    } else {
      var newItem = item.copyWith(
        count: 1,
        totalPrice: item.price,
      );
      allCartItems = [...allCartItems, newItem];
    }
    notifyListeners();
  }

  increment(SelectedItems selectedItems) {
    selectedItems.count++;
    selectedItems.totalPrice = selectedItems.count * selectedItems.price!;

    notifyListeners();
  }

  void removeFromCart(SelectedItems item) {
    allCartItems.remove(item);
    notifyListeners();
  }

  decrement(SelectedItems selectedItems) {
    //0 is the minimum value
    if (selectedItems.count > 0) {
      selectedItems.count--;
      selectedItems.totalPrice = selectedItems.count * selectedItems.price!;
    }
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
