import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate_final/Pages/Authentication/real_forget.dart';
import '../../Common class/color.dart';
import '../../Common class/fontstyle.dart';
import '../../Common class/icons.dart';
import '../../Theme/themecontroller.dart';
import '../home_pages/dash_board.dart';

class RealLogin extends StatefulWidget {
  const RealLogin({Key? key}) : super(key: key);

  @override
  State<RealLogin> createState() => _RealLoginState();
}

class _RealLoginState extends State<RealLogin> {
  bool _showPassword = false;
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(Themecontroler());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  // Validation variables and error messages
  bool isEmailValid = true;
  bool isPasswordValid = true;

  String emailErrorMessage = "";
  String passwordErrorMessage = "";

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                child: Image.asset(
              PngImage.loginimage,
              fit: BoxFit.fitWidth,
            )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 46,
                      ),
                      Row(
                        children: [
                          Text(
                            "Let's ",
                            style: lmedium.copyWith(
                              fontSize: 25,
                              color: themedata.isdark
                                  ? RealestateColor.white
                                  : RealestateColor.indigo,
                            ),
                          ),
                          Text(
                            "Sign In".tr,
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
                        height: height / 46,
                      ),
                      Text(
                        "Welcome to the Homely-Real Estate",
                        style: lregular.copyWith(
                          fontSize: 14,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.grey,
                        ),
                      ),
                      SizedBox(
                        height: height / 26,
                      ),
                      TextFormField(
                        controller: email,
                        style: lmedium.copyWith(
                            fontSize: 12, color: RealestateColor.indigo),
                        cursorColor: RealestateColor.grey,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(PngImage.email,
                                height: height / 36),
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
                        style: lmedium.copyWith(
                            fontSize: 12, color: RealestateColor.indigo),
                        cursorColor: RealestateColor.grey,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:
                                Image.asset(PngImage.lock, height: height / 36),
                          ),
                          filled: true,
                          hintText: "Password".tr,
                          hintStyle: lregular.copyWith(
                              fontSize: 12, color: RealestateColor.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          fillColor: RealestateColor.textfield,
                          errorText:
                              isPasswordValid ? null : passwordErrorMessage,
                        ),
                      ),
                      SizedBox(
                        height: height / 46,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: RealestateColor.transparent,
                            highlightColor: RealestateColor.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const RealForget();
                                },
                              ));
                            },
                            child: Text(
                              "Forget Password".tr,
                              style: lbold.copyWith(
                                fontSize: 12,
                                color: themedata.isdark
                                    ? RealestateColor.white
                                    : RealestateColor.indigo,
                              ),
                            ),
                          ),
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
                                  _showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
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
                        height: height / 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            // Perform validation
                            isEmailValid = _emailRegExp.hasMatch(email.text);
                            isPasswordValid = password.text.length >= 8;

                            // Update error messages
                            if (!isEmailValid) {
                              emailErrorMessage =
                                  "Please enter a valid email address";
                            } else {
                              emailErrorMessage = "";
                            }

                            if (!isPasswordValid) {
                              passwordErrorMessage =
                                  "Password must be at least 8 characters";
                            } else {
                              passwordErrorMessage = "";
                            }

                            // If all fields are valid, proceed with sign-in
                            if (isEmailValid && isPasswordValid) {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              )
                                  .then((value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DashBoardpage(),
                                  ),
                                );
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                                _showErrorDialog(
                                    "Invalid email or password"); // Show error message
                              });
                            } else {
                              _showErrorDialog("Enter the Email and Password");
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
                              "login".tr,
                              style: lbold.copyWith(
                                  fontSize: 16, color: RealestateColor.white),
                            )),
                          ),
                        ),
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
