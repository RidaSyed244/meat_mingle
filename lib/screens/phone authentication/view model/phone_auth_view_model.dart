import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meat_mingle/constants/constants.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneAuthState extends StateNotifier {
  PhoneAuthState() : super(false);
  String? token;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  void generateAndSaveToken() async {
    await messaging.requestPermission();
    token = await messaging.getToken();
  }

  Future<void> storeUserPhoneNo(BuildContext context) async {
    state = true; // Set isLoading to true before starting loading
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "UserPhoneNo": phoneController.text,
        "OtpCode": otpController.text,
        "UserToken": token,
      });
      final pref = await SharedPreferences.getInstance();
      pref.setString('UserPhoneNo', phoneController.text);
      pref.setString('OtpCode', otpController.text);
      pref.setString('UserToken', token.toString());
    } catch (e) {
      showCustomSnackbar(
        context,
        'Error',
        'Failed to get current location. Please check your settings.',
      );
    }
    state = false; // Set isLoading to false after loading
  }
}
