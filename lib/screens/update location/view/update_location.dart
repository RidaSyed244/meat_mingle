import 'package:flutter/material.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/custom%20data/custom%20buttons/custom_buttons.dart';
import 'package:meat_mingle/screens/dashboard/widgets/widgets.dart';
import 'package:meat_mingle/screens/update%20location/controller/controller.dart';
import 'package:meat_mingle/screens/update%20location/widgets/widgets.dart';

class UpdateLocation extends StatefulWidget {
  const UpdateLocation({Key? key}) : super(key: key);

  @override
  State<UpdateLocation> createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  bool isManual = false;
  bool isMap = false;

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        title: Text("30 منٹ میں تازہ چکن اپ کے دروازے پر",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: hight * 0.05,
          ),
          //Text in center
          Center(
            child: Text(
              "Set your location",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: hight * 0.05,
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
                  Row(
                    children: [
                      CircularCheckBox(
                          value: isManual,
                          onChanged: (value) {
                            setState(() {
                              isManual = !isManual;
                            });
                          }),
                      CustomButtons(
                          text: "Enter Address Manually",
                          height: hight * 0.07,
                          width: width * 0.6,
                          textcolor: Colors.black,
                          onPressed: () {
                            setState(() {
                              isManual = !isManual;
                            });
                          },
                          color: ColorPalette.appBGcolor,
                          fontSize: 23),
                    ],
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: isManual ? hight * 0.2 : 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: hight * 0.03,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: hight * 0.06,
                              width: width * 0.7,
                              child: TextField(
                                controller: userUpdatedLocationController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  hintText: 'Your address',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  filled: true,
                                  fillColor: ColorPalette.appBGcolor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                    // Remove the visible border
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: hight * 0.03,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: hight * 0.05,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: ColorPalette.appBGcolor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                  child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: hight * 0.05,
                  ),
                  Row(
                    children: [
                      CircularCheckBox(
                          value: isMap,
                          onChanged: (value) {
                            setState(() {
                              isMap = !isMap;
                            });
                          }),
                      CustomButtons(
                          text: "Choose on Map",
                          height: hight * 0.07,
                          width: width * 0.6,
                          textcolor: Colors.black,
                          onPressed: () {},
                          color: ColorPalette.appBGcolor,
                          fontSize: 23),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
