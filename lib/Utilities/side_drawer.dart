import 'package:afn_aqua_sync/Pages/ground_monitor_page.dart';
import 'package:afn_aqua_sync/Pages/home_page.dart';
import 'package:afn_aqua_sync/Pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../Pages/weather_page.dart';
import 'Firebase/firebase_crud.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  late FirebaseCRUD firebaseCRUD;

  @override
  void initState() {
    super.initState();

    firebaseCRUD = FirebaseCRUD();
    firebaseCRUD.activateListeners(context);

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Home Page',
            baseStyle:const TextStyle(),
            selectedStyle:const TextStyle()),
            const HomePage()
      ),

      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Profile Page',
              baseStyle: const TextStyle(),
              selectedStyle: const TextStyle()),
          const ProfilePage()
      ),

      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Ground Data Monitor',
              baseStyle: const TextStyle(),
              selectedStyle: const TextStyle()),
          const GroundMonitorPage()
      ),

      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Weather Station',
              baseStyle: const TextStyle(),
              selectedStyle: const TextStyle()),
          const WeatherPage(),
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
    );
  }

  @override
  void deactivate() {
    firebaseCRUD.deactivateListeners();
    super.deactivate();
  }
}
