import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/res/assets/images_assets.dart';

import 'package:unishare/viewmodels/services/splash_services.dart';

import '../res/colors/app_colors.dart';

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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color:AppColors.splashColor,
            // gradient:LinearGradient(colors: [
            //   AppColors.loginGradient1,
            //   AppColors.loginGradient2,
            //   AppColors.loginGradient3,
            // ],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight)
        ),
        child: Center(child: Image.asset(IconsAssets.splashLogo,width: 230,))
      ),
    );
  }
}
