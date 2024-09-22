import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/routes/routes_name.dart';

class SplashServices{
  isLoggedIn(){

        Timer(const Duration(milliseconds:3),(){
          Get.offNamed(RoutesName.loginview);
        });
      }

}