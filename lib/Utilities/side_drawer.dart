import 'package:afn_hydro_link/Pages/home_page.dart';
import 'package:afn_hydro_link/Pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Home Page',
            baseStyle: TextStyle(),
            selectedStyle: TextStyle()),
            HomePage()
      ),

      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Profile Page',
              baseStyle: TextStyle(),
              selectedStyle: TextStyle()),
          ProfilePage()
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      slidePercent: 60,
      disableAppBarDefault: true,
      screens: _pages,
      backgroundColorMenu: Colors.greenAccent.shade100,
      initPositionSelected: 0,
      // backgroundMenu: DecorationImage(image: AssetImage('lib/Images/waterpump.png')),
    );
  }
}
