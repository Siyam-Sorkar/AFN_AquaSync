import 'package:afn_hydro_link/Pages/home_page.dart';
import 'package:afn_hydro_link/Utilities/data_model.dart';
import 'package:afn_hydro_link/Utilities/side_drawer.dart';
import 'package:afn_hydro_link/Utilities/water_pipe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

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
      // home: HomePage(),
      home: SideDrawer(),
    );
  }
}
