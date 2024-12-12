import 'package:get/get.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/authentication/forget_password/after_forgetpassword_screen.dart';
import 'package:unishare/view/authentication/forget_password/forget_password.dart';
import 'package:unishare/view/home_bottom_nav/home_bottom_nav.dart';
import 'package:unishare/view/pages/audiocall_screen/notpicked_call_page.dart';
import 'package:unishare/view/pages/chat_screen/chat_screen.dart';
import 'package:unishare/view/pages/donate_page/donate_page.dart';
import 'package:unishare/view/pages/donate_page/free_or_paid_screen.dart';
import 'package:unishare/view/pages/edit_product_page/edit_product_page.dart';
import 'package:unishare/view/pages/edit_profile_page/edit_profile_page.dart';
import 'package:unishare/view/pages/favourites_page/favourites_page.dart';

import 'package:unishare/view/pages/product_page/product_page.dart';
import 'package:unishare/view/pages/users_profile/users_profile.dart';
import 'package:unishare/view/splash_Screen.dart';

import '../../view/authentication/email_verification/email_verification_screen.dart';
import '../../view/authentication/login/login_view.dart';
import '../../view/authentication/signup/signup_view.dart';
import '../../view/pages/my_adds/my_ads.dart';

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
    GetPage(
        name: RoutesName.donate_page,
        page: ()=>  DonatePage(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.freeOrPaidPage,
        page: ()=>  FreeOrPaidScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.productPage,
        page: ()=>  ProductPage(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.favouritesPage,
        page: ()=>  FavouritesPage(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.myAdsPage,
        page: ()=>  MyAds(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.editProductPage,
        page: ()=>  EditProductPage(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.editProfilePage,
        page: ()=>  EditProfilePage(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.chatScreen,
        page: ()=>  ChatScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.usersProfile,
        page: ()=>  UsersProfile(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: RoutesName.callingPage,
        page: ()=>  NotpickedCallPage(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.fadeIn
    ),




  ];
}