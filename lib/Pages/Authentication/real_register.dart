import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate_final/Pages/Authentication/real_login.dart';

import '../../Common class/color.dart';
import '../../Common class/fontstyle.dart';
import '../../Common class/icons.dart';
import '../../Theme/themecontroller.dart';

class RealRegister extends StatefulWidget {
  const RealRegister({Key? key}) : super(key: key);

  @override
  State<RealRegister> createState() => _RealRegisterState();
}

class _RealRegisterState extends State<RealRegister> {
  bool _showPassword = false;
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(Themecontroler());
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Validation variables and error messages
  bool isEmailValid = true;
  bool isFullNameValid = true;
  bool isPasswordValid = true;

  String emailErrorMessage = "";
  String fullNameErrorMessage = "";
  String passwordErrorMessage = "";

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
                  "Create Your ",
                  style: lmedium.copyWith(
                    fontSize: 25,
                    color: themedata.isdark
                        ? RealestateColor.white
                        : RealestateColor.indigo,
                  ),
                ),
                Text(
                  "account",
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
              "Welcome to the Homely Real Estate",
              style: lregular.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: height / 16,
            ),
            TextFormField(
              controller: fullname,
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
                hintText: "Full name".tr,
                hintStyle: lregular.copyWith(
                    fontSize: 12, color: RealestateColor.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                fillColor: RealestateColor.textfield,
                errorText: isFullNameValid ? null : fullNameErrorMessage,
              ),
            ),
            SizedBox(
              height: height / 46,
            ),
            TextFormField(
              controller: email,
              style:
                  lmedium.copyWith(fontSize: 12, color: RealestateColor.indigo),
              cursorColor: RealestateColor.grey,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(PngImage.email, height: height / 36),
                ),
                filled: true,
                hintText: "Email".tr,
                hintStyle: lregular.copyWith(
                    fontSize: 12, color: RealestateColor.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                fillColor: RealestateColor.textfield,
                errorText: isEmailValid ? null : emailErrorMessage,
              ),
            ),
            SizedBox(
              height: height / 46,
            ),
            TextFormField(
              controller: password,
              obscureText: !_showPassword,
              style:
                  lmedium.copyWith(fontSize: 12, color: RealestateColor.indigo),
              cursorColor: RealestateColor.grey,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(PngImage.lock, height: height / 36),
                ),
                filled: true,
                hintText: "Password".tr,
                hintStyle: lregular.copyWith(
                    fontSize: 12, color: RealestateColor.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                fillColor: RealestateColor.textfield,
                errorText: isPasswordValid ? null : passwordErrorMessage,
              ),
            ),
            SizedBox(
              height: height / 46,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _showPassword ? Icons.visibility_off : Icons.visibility,
                        color: _showPassword
                            ? RealestateColor.grey
                            : RealestateColor.indigo,
                      ),
                    ),
                    Text(
                      "Show password".tr,
                      style: lsemibold.copyWith(
                        fontSize: 12,
                        color: themedata.isdark
                            ? RealestateColor.white
                            : RealestateColor.darkgreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 16,
            ),
            InkWell(
              highlightColor: RealestateColor.transparent,
              splashColor: RealestateColor.transparent,
              onTap: () {
                setState(() {
                  // Perform validation
                  isEmailValid = email.text.isNotEmpty;
                  isFullNameValid = fullname.text.isNotEmpty;
                  isPasswordValid = password.text.isNotEmpty;

                  // Update error messages
                  if (!isEmailValid) {
                    emailErrorMessage = "Please enter your email";
                  } else {
                    emailErrorMessage = "";
                  }

                  if (!isFullNameValid) {
                    fullNameErrorMessage = "Please enter your full name";
                  } else {
                    fullNameErrorMessage = "";
                  }

                  if (!isPasswordValid) {
                    passwordErrorMessage = "Please enter a password";
                  } else {
                    passwordErrorMessage = "";
                  }
                  isEmailValid = _emailRegExp.hasMatch(email.text);
                  isPasswordValid = password.text.length >= 8;
                  // Update error messages
                  if (!isEmailValid) {
                    emailErrorMessage = "Please enter a valid email address";
                  } else {
                    emailErrorMessage = "";
                  }

                  if (!isPasswordValid) {
                    passwordErrorMessage =
                        "Password must be at least 8 characters";
                  } else {
                    passwordErrorMessage = "";
                  }

                  if (isEmailValid && isFullNameValid && isPasswordValid) {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email.text, password: password.text)
                        .then((value) {
                      print("Created New Account");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RealLogin()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }
                });
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
                    "Register".tr,
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
