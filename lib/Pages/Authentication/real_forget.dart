import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:realestate_final/Common class/color.dart';
import 'package:realestate_final/Common class/fontstyle.dart';
import 'package:realestate_final/Common class/icons.dart';
import 'package:realestate_final/Theme/themecontroller.dart';
import 'package:realestate_final/Pages/Authentication/real_login.dart';

class RealForget extends StatefulWidget {
  const RealForget({Key? key}) : super(key: key);

  @override
  State<RealForget> createState() => _RealForgetState();
}

class _RealForgetState extends State<RealForget> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(Themecontroler());

  TextEditingController email = TextEditingController();

  // Function to show a pop-up message
  Future<void> _showResetConfirmation() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Password Reset"),
          content:
              const Text("A password reset link has been sent to your email."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RealLogin(),
                  ),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: RealestateColor.transparent,
              highlightColor: RealestateColor.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: height / 20,
                width: height / 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: RealestateColor.textfield),
                child: const Center(
                    child: Icon(
                  Icons.chevron_left_outlined,
                  size: 25,
                  color: RealestateColor.darkgreen,
                )),
              ),
            ),
            SizedBox(
              height: height / 26,
            ),
            Row(
              children: [
                Text(
                  "Enter Your ",
                  style: lmedium.copyWith(
                    fontSize: 25,
                    color: themedata.isdark
                        ? RealestateColor.white
                        : RealestateColor.indigo,
                  ),
                ),
                Text(
                  "Email address",
                  style: lbold.copyWith(
                    fontSize: 25,
                    color: themedata.isdark
                        ? RealestateColor.white
                        : RealestateColor.darkgreen,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 66,
            ),
            Text(
              "Reset link will be sent to your Email address",
              style: lregular.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: height / 16,
            ),
            TextField(
              controller: email,
              style:
                  lmedium.copyWith(fontSize: 12, color: RealestateColor.indigo),
              cursorColor: RealestateColor.grey,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      PngImage.person,
                      height: height / 36,
                    ),
                  ),
                  filled: true,
                  hintText: "Email:".tr,
                  hintStyle: lregular.copyWith(
                      fontSize: 12, color: RealestateColor.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: RealestateColor.textfield),
            ),
            SizedBox(
              height: height / 16,
            ),
            InkWell(
              highlightColor: RealestateColor.transparent,
              splashColor: RealestateColor.transparent,
              onTap: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email.text);
                _showResetConfirmation();
              },
              child: Center(
                child: Container(
                  height: height / 14,
                  width: width / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: RealestateColor.lightgreen),
                  child: Center(
                      child: Text(
                    "Reset Password".tr,
                    style: lbold.copyWith(
                        fontSize: 16, color: RealestateColor.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
