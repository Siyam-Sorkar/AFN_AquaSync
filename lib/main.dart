import 'package:afn_hydro_link/Pages/ground_monitor_page.dart';
import 'package:afn_hydro_link/Pages/home_page.dart';
import 'package:afn_hydro_link/Pages/profile_page.dart';
import 'package:afn_hydro_link/Utilities/data_model.dart';
import 'package:afn_hydro_link/Utilities/side_drawer.dart';
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
        '/splash_screen'  : (context) => SplashScreen(),
        '/home'           : (context) => HomePage(),
        '/profile'        : (context) => ProfilePage(),
        '/ground_monitor' : (context) => GroundMonitorPage(),
        '/side_drawer'    : (context) => SideDrawer()
      },
      initialRoute: '/splash_screen',
    );
  }
}
