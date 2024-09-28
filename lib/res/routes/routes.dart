import 'package:get/get.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/login/login_view.dart';
import 'package:unishare/view/signup/signup_view.dart';
import 'package:unishare/view/splash_Screen.dart';

class AppRoutes{
  static appRoutes()=>[
    GetPage(
          name: RoutesName.splashscreen,
          page: ()=> SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn
      ),
    GetPage(
        name: RoutesName.loginview,
        page: ()=>  LoginView(),
        transitionDuration: const Duration(milliseconds:  250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.signupview,
        page: ()=>  SignupView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),

  ];
}