import 'package:flutter/material.dart';
import 'package:meat_mingle/screens/phone%20authentication/view/phone_auth.dart';
import 'package:meat_mingle/screens/user%20data/view/user_data_screen.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserData(),
    );
  }
}
