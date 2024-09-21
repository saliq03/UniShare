import 'package:get/get.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/splash_Screen.dart';

class AppRoutes{
  static appRoutes()=>[
    GetPage(
          name: RoutesName.splashscreen,
          page: ()=> SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn
      ),

  ];
}