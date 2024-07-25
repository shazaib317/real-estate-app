import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate_final/Pages/Authentication/login_option.dart';

import '../../Common class/color.dart';
import '../../Common class/fontstyle.dart';
import '../../Common class/icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(PngImage.bgimage),
              fit: BoxFit.cover,
            )),
          ),
          Positioned(
              top: 210,
              left: 70,
              child: Center(
                  child: Image.asset(
                PngImage.bglogo,
                height: 250,
              ))),
          Positioned(
            bottom: 50,
            left: 90,
            child: InkWell(
              splashColor: RealestateColor.transparent,
              highlightColor: RealestateColor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginOption();
                  },
                ));
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: RealestateColor.lightgreen),
                child: Center(
                    child: Text(
                  "lets start".tr,
                  style: lbold.copyWith(
                      fontSize: 16, color: RealestateColor.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
