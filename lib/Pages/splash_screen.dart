import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 2),() => Navigator.pushReplacementNamed(context, '/side_drawer'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(00, 30, 00, 1),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Image(image: AssetImage('lib/Images/Logo.png'),),
        )
      ),
    );
  }
}
