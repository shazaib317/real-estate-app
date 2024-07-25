import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate_final/Pages/Authentication/real_login.dart';
import 'package:realestate_final/Pages/Authentication/real_register.dart';
import '../../Common class/color.dart';
import '../../Common class/fontstyle.dart';
import '../../Common class/icons.dart';
import '../../Theme/themecontroller.dart';

class LoginOption extends StatefulWidget {
  const LoginOption({Key? key}) : super(key: key);

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(Themecontroler());
  List<String> imagelist = [
    PngImage.option1,
    PngImage.option2,
    PngImage.pagethreeimage,
    PngImage.option4
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 46, vertical: height / 200),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3 / 3),
                itemBuilder: (context, index) {
                  return Container(
                    height: height / 1,
                    width: width / 4,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imagelist[index],
                          fit: BoxFit.fitWidth,
                        )),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 66, vertical: height / 36),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ready To ",
                          style: lregular.copyWith(
                            fontSize: 22,
                            color: themedata.isdark
                                ? RealestateColor.white
                                : RealestateColor.indigo,
                          ),
                        ),
                        Text(
                          "explore? ",
                          style: lbold.copyWith(
                            fontSize: 22,
                            color: themedata.isdark
                                ? RealestateColor.white
                                : RealestateColor.darkgreen,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    InkWell(
                      highlightColor: RealestateColor.transparent,
                      splashColor: RealestateColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const RealLogin();
                          },
                        ));
                      },
                      child: Container(
                        height: height / 14,
                        width: width / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: RealestateColor.lightgreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              color: RealestateColor.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: width / 46,
                            ),
                            Text(
                              "Continue with Email".tr,
                              style: lbold.copyWith(
                                  fontSize: 16, color: RealestateColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 46,
                    ),
                    Row(
                      children: [
                        Container(
                            height: height / 500,
                            width: width / 2.4,
                            color: RealestateColor.lightgrey),
                        SizedBox(
                          width: width / 46,
                        ),
                        Text(
                          "OR",
                          style: lsemibold.copyWith(
                              fontSize: 10, color: RealestateColor.lightgrey),
                        ),
                        SizedBox(
                          width: width / 46,
                        ),
                        Container(
                            height: height / 500,
                            width: width / 2.4,
                            color: RealestateColor.lightgrey),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    InkWell(
                      highlightColor: RealestateColor.transparent,
                      splashColor: RealestateColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const RealRegister();
                          },
                        ));
                      },
                      child: Container(
                        height: height / 14,
                        width: width / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: RealestateColor.lightgreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person_outlined,
                              color: RealestateColor.white,
                              size: 22,
                            ),
                            SizedBox(
                              width: width / 46,
                            ),
                            Text(
                              "Create An Account".tr,
                              style: lbold.copyWith(
                                  fontSize: 16, color: RealestateColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
