import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/screens/order%20confirmation/model/order_confimation_model.dart';

class ConfirmOrder extends StateNotifier {
  ConfirmOrder() : super(0);
  Future<void> confirmOrders(
    subtotalls,
    userLatitude,
    userLongitude,
    userName,
  ) async {
    final allOrders = FirebaseFirestore.instance
        .collection("AllOrders")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Orders");
  }
}
