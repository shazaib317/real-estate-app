import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate_final/Pages/Profile_pages/setting_screen.dart';

import '../../Common class/color.dart';
import '../../Common class/fontstyle.dart';
import '../../Theme/themecontroller.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _togglePasswordStatus1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _togglePasswordStatus2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  final themedata = Get.put(Themecontroler());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 22, horizontal: width / 36),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        size: 20,
                        color: RealestateColor.indigo,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: width / 4.5,
                  ),
                  Text(
                    "change password".tr,
                    style: lbold.copyWith(
                      fontSize: 14,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.indigo,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                    hintText: "Old Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _togglePasswordStatus,
                      color: RealestateColor.grey,
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    fillColor: RealestateColor.textfield,
                    hintStyle: lregular.copyWith(color: RealestateColor.grey)),
                cursorColor: RealestateColor.grey,
              ),
              SizedBox(
                height: height / 36,
              ),
              TextField(
                obscureText: _obscureText1,
                decoration: InputDecoration(
                    hintText: "New Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText1 ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _togglePasswordStatus1,
                      color: RealestateColor.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: RealestateColor.textfield,
                    hintStyle: lregular.copyWith(color: RealestateColor.grey)),
                cursorColor: RealestateColor.grey,
              ),
              SizedBox(
                height: height / 36,
              ),
              TextField(
                obscureText: _obscureText2,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText2 ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _togglePasswordStatus2,
                      color: RealestateColor.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: RealestateColor.textfield,
                    hintStyle: lregular.copyWith(color: RealestateColor.grey)),
                cursorColor: RealestateColor.grey,
              ),
              SizedBox(height: height / 6),
              InkWell(
                splashColor: RealestateColor.transparent,
                highlightColor: RealestateColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ));
                },
                child: Container(
                  height: height / 15,
                  width: width / 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themedata.isdark
                        ? RealestateColor.white
                        : RealestateColor.darkgreen,
                  ),
                  child: Center(
                    child: Text('Reset'.tr,
                        style: lbold.copyWith(
                            color: themedata.isdark
                                ? RealestateColor.darkblack
                                : RealestateColor.white,
                            fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
