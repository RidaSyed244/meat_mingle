import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/screens/dashboard/model/dashboard_model.dart';
import 'package:meat_mingle/screens/dashboard/view/dashboard.dart';
import 'package:meat_mingle/screens/order%20confirmation/view/confirm_order.dart';
import 'package:meat_mingle/screens/update%20location/view/update_location.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(dashboardModel);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Free Delivery More than 5 Kg",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Delivery Charges 40 Rs",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 7.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    '${cart.totalPrice}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'کل',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: Container(
                    height: 6.h,
                    width: 27.w,
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat, color: Colors.white),
                        SizedBox(width: 2.w),
                        Text('Chat', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              GestureDetector(
                onTap: () {
                  print(cart.cartItems);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateLocation(),
                    ),
                  );
                },
                child: Container(
                  height: 7.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'ابھی خریدئے',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<SelectedItems> itemList = [
  SelectedItems(
    imagePath: "assets/images/chick.png",
    name: "1 kg leg Chicken",
    urduName: "1 کلو ٹانگ چکن",
    price: 500,
    count: 0,
    totalPrice: 0,
    isSelected: false,
  ),
  SelectedItems(
    imagePath: "assets/images/chick.png",
    name: "1 kg leg Chicken",
    urduName: "1 کلو ٹانگ چکن",
    price: 500,
    count: 0,
    totalPrice: 0,
    isSelected: false,
  ),
  SelectedItems(
    imagePath: "assets/images/chick.png",
    name: "1 kg leg Chicken",
    urduName: "1 کلو ٹانگ چکن",
    price: 500,
    count: 0,
    totalPrice: 0,
    isSelected: false,
  ),
  SelectedItems(
    imagePath: "assets/images/chick.png",
    name: "1 kg leg Chicken",
    urduName: "1 کلو ٹانگ چ",
    price: 500,
    count: 0,
    totalPrice: 0,
    isSelected: false,
  ),
];
