import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common class/color.dart';
import '../../Common class/fontstyle.dart';
import '../../Theme/themecontroller.dart';
import '../Favorite_pages/favorite_screen.dart';
import '../Profile_pages/profile_screen.dart';
import '../Search_pages/search_screen.dart';
import 'home.dart';

class DashBoardpage extends StatefulWidget {
  const DashBoardpage({Key? key}) : super(key: key);

  @override
  State<DashBoardpage> createState() => _DashBoardpageState();
}

class _DashBoardpageState extends State<DashBoardpage> {
  final List<Widget> _screen = [
    const Home(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  bool isdark = true;
  int selectindex = 0;
  final themedata = Get.find<Themecontroler>();
  final PageController pageController = PageController();

  void onTappedBar(int value) {
    setState(() {
      selectindex = value;
    });
    // pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Themecontroler>(builder: (controler) {
      return Scaffold(
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width >= 640)
              NavigationRail(
                  backgroundColor: themedata.isdark
                      ? RealestateColor.black
                      : RealestateColor.white,
                  onDestinationSelected: onTappedBar,
                  destinations: [
                    NavigationRailDestination(
                        selectedIcon: Icon(
                          Icons.home_filled,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.darkgreen,
                          size: 20,
                        ),
                        icon: Icon(
                          Icons.home_outlined,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.indigo,
                          size: 20,
                        ),
                        label: Text(
                          "Home",
                          style: lregular.copyWith(
                              color: themedata.isdark
                                  ? RealestateColor.white
                                  : RealestateColor.black),
                        )),
                    NavigationRailDestination(
                        selectedIcon: Icon(
                          Icons.search_sharp,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.darkgreen,
                          size: 20,
                        ),
                        icon: Icon(
                          Icons.search,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.indigo,
                          size: 20,
                        ),
                        label: Text(
                          "Search",
                          style: lregular.copyWith(
                              color: themedata.isdark
                                  ? RealestateColor.white
                                  : RealestateColor.black),
                        )),
                    NavigationRailDestination(
                        selectedIcon: Icon(
                          Icons.shopping_cart_rounded,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.darkgreen,
                          size: 20,
                        ),
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.indigo,
                          size: 20,
                        ),
                        label: Text(
                          "Favorite",
                          style: lregular.copyWith(
                              color: themedata.isdark
                                  ? RealestateColor.white
                                  : RealestateColor.black),
                        )),
                    NavigationRailDestination(
                        selectedIcon: Icon(
                          Icons.person,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.darkgreen,
                          size: 20,
                        ),
                        icon: Icon(
                          Icons.person_outline_outlined,
                          color: themedata.isdark
                              ? RealestateColor.white
                              : RealestateColor.indigo,
                          size: 20,
                        ),
                        label: Text(
                          "Profile",
                          style: lregular.copyWith(
                              color: themedata.isdark
                                  ? RealestateColor.white
                                  : RealestateColor.black),
                        )),
                  ],
                  labelType: NavigationRailLabelType.selected,
                  selectedLabelTextStyle:
                      lregular.copyWith(color: RealestateColor.darkgreen),
                  selectedIndex: selectindex),
            Expanded(
              child: _screen[selectindex],
            )
            // PageView(
            //   physics: NeverScrollableScrollPhysics(),
            //   controller: pageController,
            //   children: [home(), bookinghistory(), profile()],
            // ),
          ],
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width < 640
            ? BottomNavigationBar(
                backgroundColor: themedata.isdark
                    ? RealestateColor.black
                    : RealestateColor.white,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.indigo,
                      size: 25,
                    ),
                    backgroundColor: themedata.isdark
                        ? RealestateColor.black
                        : RealestateColor.white,
                    label: "",
                    activeIcon: Icon(
                      Icons.home_filled,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.darkgreen,
                      size: 25,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.indigo,
                      size: 25,
                    ),
                    backgroundColor: themedata.isdark
                        ? RealestateColor.black
                        : RealestateColor.white,
                    label: "",
                    activeIcon: Icon(
                      Icons.search_sharp,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.darkgreen,
                      size: 25,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.indigo,
                      size: 25,
                    ),
                    backgroundColor: themedata.isdark
                        ? RealestateColor.black
                        : RealestateColor.white,
                    label: "",
                    activeIcon: Icon(
                      Icons.favorite,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.darkgreen,
                      size: 25,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline_outlined,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.indigo,
                      size: 25,
                    ),
                    backgroundColor: themedata.isdark
                        ? RealestateColor.black
                        : RealestateColor.white,
                    label: "",
                    activeIcon: Icon(
                      Icons.person,
                      color: themedata.isdark
                          ? RealestateColor.white
                          : RealestateColor.darkgreen,
                      size: 25,
                    ),
                  ),
                ],
                onTap: onTappedBar,
                currentIndex: selectindex,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: RealestateColor.darkgreen,
                showSelectedLabels: false,
                showUnselectedLabels: false,
              )
            : null,
      );
    });
    // );
  }
}
