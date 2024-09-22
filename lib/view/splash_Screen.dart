import 'package:flutter/material.dart';
import 'package:unishare/viewmodels/services/splash_services.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices=SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.isLoggedIn();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
    );
  }
}
