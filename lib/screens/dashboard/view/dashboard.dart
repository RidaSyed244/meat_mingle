import 'package:flutter/material.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/custom%20data/custom%20containers/custom_containers.dart';
import 'package:meat_mingle/screens/dashboard/widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPalette.appBGcolor,
      bottomNavigationBar: BottomBar(hight: hight, width: width),
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
      body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainers(
                image: Image.asset(
                  "assets/images/chick.png",
                  fit: BoxFit.contain,
                ),
                name: "1 kg leg Chicken",
                urduName: "1 کلو ٹانگ چکن",
                price: 500,
                count: 0,
                totalPrice: 500,
                addIcon: Icon(Icons.add),
                removeIcon: Icon(Icons.remove),
              ),
            );
          }),
    );
  }
}
