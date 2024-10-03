import 'package:get/get.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/splash_Screen.dart';

import '../../view/authentication/email_verification/email_verification_screen.dart';
import '../../view/authentication/login/login_view.dart';
import '../../view/authentication/signup/signup_view.dart';

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
    GetPage(
        name: RoutesName.emailverification,
        page: ()=>  EmailVerificationScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),

  ];
}