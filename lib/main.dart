import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/screens/dashboard/view/dashboard.dart';
import 'package:meat_mingle/screens/order%20confirmation/view/confirm_order.dart';
import 'package:meat_mingle/screens/phone%20authentication/view/phone_auth.dart';
import 'package:meat_mingle/screens/update%20location/view/update_location.dart';
import 'package:meat_mingle/screens/user%20data/view%20model/user_data_view_model.dart';
import 'package:meat_mingle/screens/user%20data/view/user_data_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Access the global instance of UserDataModel
    final userDataModel = UserDataModel();

    // Call the getCurrentLocation function
    await userDataModel.getCurrentLocation();
    await userDataModel.addUserData();
    return Future.value(true);
  });
}

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  // Workmanager().registerPeriodicTask(
  //   "1",
  //   "get_location_background_task",
  //   frequency: Duration(minutes: 2), // Change the frequency to 5 seconds
  // );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      );
    });
  }
}
