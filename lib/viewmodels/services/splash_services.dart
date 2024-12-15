import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

class SplashServices{
  final userPrefrences=UserPrefrences();

  isLoggedIn() async {

     userPrefrences.getLoginKey().then((value){
      if(value==true){
          Timer(const Duration(milliseconds: 1),(){
            FlutterNativeSplash.remove();
            Get.offNamed(RoutesName.homeBottomNav);
          });
        }
      else{
          Timer(const Duration(milliseconds: 1),(){
            FlutterNativeSplash.remove();
            Get.offNamed(RoutesName.loginview);
          });
        }
    });

      }

}