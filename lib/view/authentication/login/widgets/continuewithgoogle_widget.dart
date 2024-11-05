import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/assets/icons_assets.dart';

import '../../../../viewmodels/controller/login_controller.dart';

class ContinuewithgoogleWidget extends StatelessWidget {
   ContinuewithgoogleWidget({super.key});

  final loginController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return  InkWell(
          onTap: (){
            loginController.logInWithGoogle();
          },
          child: Card(
            elevation: 8,
            color: Colors.white,
            shadowColor: Colors.black26,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: loginController.continuewithgoogleLoading.value? const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(child: CircularProgressIndicator()),
            ):Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Image.asset(IconsAssets.google,width: 30,height: 30,),
                ),
                const Text("Continue with Google",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
      );
    });


  }
}
