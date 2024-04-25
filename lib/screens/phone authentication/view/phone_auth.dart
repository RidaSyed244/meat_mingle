import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meat_mingle/color%20pallete/colors.dart';
import 'package:meat_mingle/constants/constants.dart';
import 'package:meat_mingle/custom%20data/custom%20buttons/custom_buttons.dart';
import 'package:meat_mingle/custom%20data/custom%20text%20fields/custom_text_fields.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';
import 'package:meat_mingle/screens/user%20data/view/user_data_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneAuth extends ConsumerStatefulWidget {
  const PhoneAuth({super.key});
  static String verify = '';

  @override
  ConsumerState<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends ConsumerState<PhoneAuth> {
  @override
  void initState() {
    super.initState();
    ref.read(phoneMotifier.notifier).generateAndSaveToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.appBGcolor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Stack(
          children: [
            ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Welcome to Meat Mingle",
                      style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.appTextColor)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("Chicken at Your Door",
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.appTextColor)),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text("میٹ ملنگ میں خوش آمدید\n چکن آپ کے دروازے پر ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.appTextColor)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                  child: Container(
                    child: Image.asset("assets/images/meat_logo.png",
                        height: 15.h, width: 15.w, fit: BoxFit.contain),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Phone Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.appTextColor)),
                ),
                SizedBox(height: 5),
                CustomTextFields(
                  prefixIcon: IconButton(
                      onPressed: () async {}, icon: Icon(Icons.email)),
                  suffixIcon: TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: "${phoneController.text}",
                        verificationCompleted:
                            (PhoneAuthCredential credential) {
                          print(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          print(e.message);
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          PhoneAuth.verify = verificationId;
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                      showCustomSnackbar(
                        context,
                        "Code Sent",
                        "Code has been sent to your phone number. Please check your phone or wait for the code.",
                      );
                    },
                    child: Text("Send Code",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorPalette.appTextColor)),
                  ),
                  text: "(+92300-0000000)",
                  keyBoardType: TextInputType.phone,
                  height: 10.h,
                  width: 70.w,
                  controller: phoneController,
                  textcolor: ColorPalette.appTextColor,
                  onPressed: () {},
                  color: ColorPalette.appBGcolor,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Enter Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.appTextColor)),
                ),
                SizedBox(height: 5),
                CustomTextFields(
                  prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                  text: "0000",
                  keyBoardType: TextInputType.phone,
                  height: 15.h,
                  width: 70.w,
                  controller: otpController,
                  textcolor: ColorPalette.appTextColor,
                  onPressed: () {},
                  color: ColorPalette.appBGcolor,
                  fontSize: 16,
                ),
                SizedBox(height: 15.h),
                CustomButtons(
                  text: "Log In",
                  height: 8.h,
                  width: 10.w,
                  textcolor: Colors.white,
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: PhoneAuth.verify,
                              smsCode: otpController.text);
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);

                      await ref
                          .read(phoneMotifier.notifier)
                          .storeUserPhoneNo(context);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserData()));
                    } catch (e) {
                      throw Exception("Error occurred: $e");
                    }
                  },
                  color: ColorPalette.appButtonsColor,
                  fontSize: 20,
                ),
              ],
            ),
            if (ref.watch(phoneMotifier) == true)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
