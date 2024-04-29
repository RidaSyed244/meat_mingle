import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/screens/dashboard/view/dashboard.dart';
import 'package:meat_mingle/screens/phone%20authentication/view/phone_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final pref = await SharedPreferences.getInstance();
  final userPhNo = pref.getString('UserPhoneNo');

  runApp(ProviderScope(child: MyApp(userPhNo: userPhNo)));
}

class MyApp extends StatelessWidget {
  final String? userPhNo;
  const MyApp({super.key, this.userPhNo});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: userPhNo == null ? PhoneAuth() : Dashboard(),
      );
    });
  }
}
