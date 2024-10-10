import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

class SplashServices{
  final userPrefrences=UserPrefrences();

  isLoggedIn() async {

     userPrefrences.GetLoginKey().then((value){
      if(value==true){
          Timer(const Duration(milliseconds:3),(){
            Get.offNamed(RoutesName.homeBottomNav);
          });
        }
      else{
          Timer(const Duration(milliseconds:3),(){
            Get.offNamed(RoutesName.loginview);
          });
        }
    });

      }

}