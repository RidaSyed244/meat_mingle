import 'package:flutter/material.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/custom%20data/custom%20buttons/custom_buttons.dart';
import 'package:meat_mingle/custom%20data/custom%20text%20fields/custom_text_fields.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPalette.appBGcolor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("User Data",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(children: [
          Text(
            'Meat Mingle',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            'Please provide your name\nand address below',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(height: 25),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Name*",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.appTextColor)),
          ),
          SizedBox(height: 5),
          CustomTextFields(
            text: "Enter your name",
            prefixIcon: IconButton(
                icon: Icon(Icons.person),
                color: ColorPalette.appTextColor,
                onPressed: () {}),
            controller: nameController,
            textcolor: ColorPalette.appTextColor,
            onPressed: () {},
            color: ColorPalette.appBGcolor,
            fontSize: 16,
          ),
          SizedBox(height: 25),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Address*",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.appTextColor)),
          ),
          SizedBox(height: 5),
          CustomTextFields(
            prefixIcon: IconButton(
                icon: Icon(Icons.location_on),
                color: ColorPalette.appTextColor,
                onPressed: () {}),
            text: "Enter your address",
            controller: nameController,
            textcolor: ColorPalette.appTextColor,
            onPressed: () {},
            color: ColorPalette.appBGcolor,
            fontSize: 16,
          ),
          SizedBox(height: hight * 0.1),
          CustomButtons(
            text: "Continue",
            height: hight * 0.07,
            width: width * 0.6,
            textcolor: Colors.white,
            onPressed: () {},
            color: ColorPalette.appButtonsColor,
            fontSize: 20,
          )
        ]),
      ),
    );
  }
}
