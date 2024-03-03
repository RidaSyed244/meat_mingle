import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';

class PhoneAuthState extends StateNotifier {
  PhoneAuthState() : super(0);
  String token = '';
  Future storeUserPhoneNo() async {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "UserPhoneNo": phoneController.text,
    });
  }

  getToken() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "UserToken": token,
    });
  }
}
