import 'package:afn_aqua_sync/Pages/ground_monitor_page.dart';
import 'package:afn_aqua_sync/Pages/home_page.dart';
import 'package:afn_aqua_sync/Pages/profile_page.dart';
import 'package:afn_aqua_sync/Pages/weather_page.dart';
import 'package:afn_aqua_sync/Utilities/Data%20Models/data_model.dart';
import 'package:afn_aqua_sync/Utilities/side_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/splash_screen.dart';
import 'Utilities/Firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    ChangeNotifierProvider(create: (context) => DataModel(), child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GroundMonitorPage(),
      // home: SideDrawer(),
      routes: {
        '/splash_screen'  : (context) => const SplashScreen(),
        '/home'           : (context) => const HomePage(),
        '/profile'        : (context) => const ProfilePage(),
        '/ground_monitor' : (context) => const GroundMonitorPage(),
        '/weather_station': (context) => const WeatherPage(),
        '/side_drawer'    : (context) => const SideDrawer()
      },
      initialRoute: '/splash_screen',
    );
  }
}
