import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/screens/phone%20authentication/view%20model/phone_auth_view_model.dart';
import 'package:meat_mingle/screens/phone%20authentication/view/phone_auth.dart';

final TextEditingController phoneController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final phoneMotifier = StateNotifierProvider((ref) => PhoneAuthState());
final TextEditingController otpController = TextEditingController();
