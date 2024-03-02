import 'package:flutter/material.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/custom%20data/custom%20buttons/custom_buttons.dart';
import 'package:meat_mingle/screens/order%20confirmation/view%20model/order_confirmation_view_model.dart';

class ConfirmOrders extends StatefulWidget {
  const ConfirmOrders({super.key});

  @override
  State<ConfirmOrders> createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends State<ConfirmOrders> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Order Confirmation",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: DataTable(
                    columnSpacing: 45,
                    columns: [
                      DataColumn(
                          label: Text('Price',
                              style: TextStyle(color: Colors.black))),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Quantity')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: orders.map((order) {
                      return DataRow(cells: [
                        DataCell(Text(order.itemPrice)),
                        DataCell(Text(order.productName)),
                        DataCell(Text(order.quantity)),
                        DataCell(Text(order.totalPrice)),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtons(
              text: "Confirm Now",
              height: hight * 0.06,
              width: width * 0.7,
              textcolor: Colors.white,
              onPressed: () {},
              color: Colors.black,
              fontSize: 23,
            )
          ],
        ),
      ),
    );
  }
}
