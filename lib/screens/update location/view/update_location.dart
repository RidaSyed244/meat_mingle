import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/constants/constants.dart';
import 'package:meat_mingle/custom%20data/custom%20buttons/custom_buttons.dart';
import 'package:meat_mingle/screens/order%20confirmation/view/confirm_order.dart';
import 'package:meat_mingle/screens/update%20location/controller/controller.dart';
import 'package:meat_mingle/screens/update%20location/widgets/widgets.dart';
import 'package:meat_mingle/screens/user%20data/view/user_data_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final selectedRadioProvider = StateProvider<int>((ref) => 0);

class UpdateLocation extends ConsumerStatefulWidget {
  const UpdateLocation({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends ConsumerState<UpdateLocation> {
  bool isManual = false;
  bool isMap = false;

  void setSelectedRadio(int val) {
    ref.read(selectedRadioProvider.notifier).state = val;
  }

  @override
  Widget build(BuildContext context) {
    final selectedRadio = ref.watch(selectedRadioProvider);

    return Scaffold(
        backgroundColor: ColorPalette.appBGcolor,
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 35),
          backgroundColor: ColorPalette.appbarColor,
          centerTitle: true,
          elevation: 2,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.asset(
                  "assets/images/meat_logo.png",
                  height: 14.h,
                  width: 14.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          title: Text(
            "30 منٹ میں تازہ چکن اپ کے دروازے پر",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Text(
                "Update your location",
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Yellow background color
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
                      ),
                      child: RadioListTile(
                        title: Text('Current Location'),
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (value) async {
                          setSelectedRadio(value as int);

                          await ref
                              .read(userDataModel.notifier)
                              .getCurrentLocation(context);
                          print("Get updated location");
                        },
                        activeColor: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Yellow background color
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
                      ),
                      child: RadioListTile(
                        title: Text('Choose on Map'),
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setSelectedRadio(value as int);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => MapSceen()),
                          // );
                        },
                        activeColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: CustomButtons(
                  text: "Confirm now",
                  height: 7.h,
                  width: 60.w,
                  textcolor: Colors.white,
                  onPressed: () async {
                    await ref.read(userDataModel.notifier).updateUserData();

                    showCustomSnackbar(
                      context,
                      "Got It!!!",
                      "Your current location has been updated. You can now proceed.",
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConfirmOrders()),
                    );
                  },
                  color: Colors.black,
                  fontSize: 23),
            ),
          ],
        ));
  }
}
