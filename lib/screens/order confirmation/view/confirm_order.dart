import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/custom%20data/custom%20buttons/custom_buttons.dart';
import 'package:meat_mingle/screens/dashboard/model/dashboard_model.dart';
import 'package:meat_mingle/screens/dashboard/view/dashboard.dart';
import 'package:meat_mingle/screens/order%20confirmation/view%20model/order_confirmation_view_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmOrders extends ConsumerStatefulWidget {
  const ConfirmOrders({super.key});

  @override
  ConsumerState<ConfirmOrders> createState() => _ConfirmOrdersState();
}

class _ConfirmOrdersState extends ConsumerState<ConfirmOrders> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(dashboardModel);

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
        title: Text("30 منٹ میں تازہ چکن اپ کے دروازے پر",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Order Confirmation",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 3.h,
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
                    columnSpacing: 12.w,
                    columns: [
                      DataColumn(
                          label: Text('Price',
                              style: TextStyle(color: Colors.black))),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Quantity')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: cart.allCartItems.map((order) {
                      // Using selectedItems instead of 'orders'
                      return DataRow(cells: [
                        DataCell(Text(order.price
                            .toString())), // Assuming price is int, convert it to string
                        DataCell(Text(
                            order.name ?? '')), // Display name, if available
                        DataCell(Text(order.count
                            .toString())), // Assuming count is int, convert it to string
                        DataCell(Text(order.totalPrice
                            .toString())), // Assuming totalPrice is int, convert it to string
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomButtons(
              text: "Confirm Now",
              height: 8.h,
              width: 80.w,
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
