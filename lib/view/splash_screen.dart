import 'package:flutter/material.dart';

import '../res/assets/icons_assets.dart';
import '../res/colors/app_colors.dart';
import '../services/notification_services/notification_service.dart';
import '../viewmodels/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices=SplashServices();
  NotificationServices notificationServices=NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
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
