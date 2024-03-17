import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/custom%20data/custom%20buttons/custom_buttons.dart';
import 'package:meat_mingle/custom%20data/custom%20text%20fields/custom_text_fields.dart';
import 'package:meat_mingle/screens/dashboard/view/dashboard.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';
import 'package:meat_mingle/screens/user%20data/view%20model/user_data_view_model.dart';

final userDataModel = StateNotifierProvider((ref) {
  return UserDataModel();
});

class UserData extends ConsumerStatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  ConsumerState<UserData> createState() => _UserDataState();
}

class _UserDataState extends ConsumerState<UserData> {
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataModel);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPalette.appBGcolor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "User Data",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            Text(
              'Meat Mingle',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please provide your name\nand address below',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Name*",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.appTextColor,
                ),
              ),
            ),
            SizedBox(height: 5),
            CustomTextFields(
              text: "Enter your name",
              prefixIcon: IconButton(
                icon: Icon(Icons.person),
                color: ColorPalette.appTextColor,
                onPressed: () {},
              ),
              controller: nameController,
              textcolor: ColorPalette.appTextColor,
              onPressed: () {},
              color: ColorPalette.appBGcolor,
              fontSize: 16,
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Address*",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.appTextColor,
                ),
              ),
            ),
            SizedBox(height: 5),
            RadioListTile(
              title: Text('Current Location'),
              value: 1,
              groupValue: userData,
              onChanged: (value) async {
                await ref
                    .read(userDataModel.notifier)
                    .setSelectedOption(value as int);
                await ref.read(userDataModel.notifier).getCurrentLocation();
                await ref.read(userDataModel.notifier).addUserData();
                ref.read(userDataModel.notifier).showCustomSnackbar(
                      context,
                      "Got It!!!",
                      "Your current location has been saved. You can now proceed.",
                    );
              },
              activeColor: Colors.black, // Change the fill color when selected
            ),
            RadioListTile(
              title: Text('Choose on Map'),
              value: 2,
              groupValue: userData,
              onChanged: (value) {
                ref
                    .read(userDataModel.notifier)
                    .setSelectedOption(value as int);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MapSceen()),
                // );
              },
              activeColor: Colors.black, // Change the fill color when selected
            ),
            SizedBox(height: 15),
            CustomButtons(
              text: "Continue",
              height: height * 0.07,
              width: width * 0.6,
              textcolor: Colors.white,
              onPressed: () {
                if (userData == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                } else if (userData == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                } else {
                  ref.read(userDataModel.notifier).showCustomSnackbar(
                        context,
                        "Alert!!!",
                        "Please enter your name and select address option.",
                      );
                }
              },
              color: Colors.black,
              fontSize: 20,
            )
          ],
        ),
      ),
    );
  }
}
