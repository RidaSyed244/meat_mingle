import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';
import 'package:meat_mingle/screens/phone%20authentication/view/phone_auth.dart';
import 'package:meat_mingle/screens/user%20data/view/user_data_screen.dart';

class PhoneAuthState extends StateNotifier {
  PhoneAuthState() : super(0);
  String token = '';
  bool isLoading = true;
  Future<void> storeUserPhoneNo() async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "UserPhoneNo": phoneController.text,
        "OtpCode": otpController.text,
        // "UserToken": token,
      });
    } catch (e) {
      isLoading = false;
      // Notify listeners to update UI
      throw Exception("Error occurred: $e");
    }
  }
}
