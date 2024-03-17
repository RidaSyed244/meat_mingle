import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/custom%20data/custom%20containers/custom_containers.dart';
import 'package:meat_mingle/screens/dashboard/model/dashboard_model.dart';
import 'package:meat_mingle/screens/dashboard/view%20model/dashboard_view_model.dart';
import 'package:meat_mingle/screens/dashboard/widgets/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final dashboardModel = ChangeNotifierProvider((ref) => DashboardModel());

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  void incrementItem(SelectedItems item) {
    ref.read(dashboardModel).increment(item);
  }

  void decrementItem(SelectedItems item) {
    ref.read(dashboardModel).decrement(item);
  }

  void addToCartt(SelectedItems item) {
    ref.read(dashboardModel.notifier).addToCart(item);
  }

  void removeFromCartt(SelectedItems item) {
    ref.read(dashboardModel.notifier).removeFromCart(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.appBGcolor,
      bottomNavigationBar: BottomBar(),
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
      body: Consumer(
        builder: (context, watch, child) {
          final cart = ref.watch(dashboardModel);
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 1.h),
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final item = itemList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 8.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: item.count >= 1
                            ? Center(
                                child: Container(
                                  width: 4.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.yellow,
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: CustomContainers(
                        image: Image.asset(
                          item.imagePath.toString(),
                          fit: BoxFit.contain,
                        ),
                        name: item.name,
                        urduName: item.urduName,
                        price: item.price,
                        count: item.count,
                        totalPrice: item.totalPrice,
                        addIcon: Icon(
                          Icons.add,
                          size: 40,
                        ),
                        icon2pess: () {
                          decrementItem(item);
                          removeFromCartt(item);
                        },
                        icon1pess: () {
                          incrementItem(item);
                          addToCartt(item);
                        },
                        removeIcon: Icon(
                          Icons.remove,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
