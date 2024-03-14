import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Free Delivery More than 5 Kg",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Text("Delivery Charges 40 Rs",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black))
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
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Total',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Text('000000',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('کل',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
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
              Container(
                height: 7.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Buy Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('ابھی خریدئے',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Map<int, bool> selectedItems = {};
List<Map<String, dynamic>> itemList = [
  {
    'imagePath': "assets/images/chick.png",
    'name': "1 kg leg Chicken",
    'urduName': "1 کلو ٹانگ چکن",
    'price': 500,
    'count': 0,
    'totalPrice': 500,
  },
  {
    'imagePath': "assets/images/chick.png",
    'name': "1 kg leg Chicken",
    'urduName': "1 کلو ٹانگ چکن",
    'price': 500,
    'count': 0,
    'totalPrice': 500,
  },
  {
    'imagePath': "assets/images/chick.png",
    'name': "1 kg leg Chicken",
    'urduName': "1 کلو ٹانگ چکن",
    'price': 500,
    'count': 0,
    'totalPrice': 500,
  },
  {
    'imagePath': "assets/images/chick.png",
    'name': "1 kg leg Chicken",
    'urduName': "1 کلو ٹانگ چکن",
    'price': 500,
    'count': 0,
    'totalPrice': 500,
  },
];
