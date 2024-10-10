import 'package:get/get.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/authentication/forget_password/after_forgetpassword_screen.dart';
import 'package:unishare/view/authentication/forget_password/forget_password.dart';
import 'package:unishare/view/home_bottom_nav/home_bottom_nav.dart';
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
    GetPage(
        name: RoutesName.forgetPassword,
        page: ()=>  ForgetPassword(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.afterForgetPasswordScreen,
        page: ()=>  AfterForgetpasswordScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.homeBottomNav,
        page: ()=>  HomeBottomNav(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),

  ];
}