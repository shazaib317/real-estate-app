import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate_final/Pages/Authentication/splash_screen.dart';
import 'package:realestate_final/Theme/theme.dart';
import 'package:realestate_final/Theme/themecontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themedata = Get.put(Themecontroler());

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themedata.isdark ? MyThemes.darkTheme : MyThemes.lightTheme,
        home: const SplashScreen());
  }
}