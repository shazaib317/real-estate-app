import 'package:get/get.dart';
import 'package:realestate_final/Theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common class/prefsname.dart';

class Themecontroler extends GetxController {
  @override
  void onInit() {
    SharedPreferences.getInstance().then((value) {
      isdark = value.getBool(isDarkMode)!;
    });
    update();
    super.onInit();
  }

  var isdark = false;
  Future<void> changeThem(state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdark = prefs.getBool(isDarkMode) ?? true;
    isdark = !isdark;

    if (state == true) {
      Get.changeTheme(MyThemes.darkTheme);
      isdark = true;
    } else {
      Get.changeTheme(MyThemes.lightTheme);
      isdark = false;
    }
    update();
  }
}
