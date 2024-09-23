import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/viewmodels/controller/login_controller.dart';
import 'package:unishare/viewmodels/controller/signup_controller.dart';

class SignupPasswordWidget extends StatelessWidget {
   SignupPasswordWidget({super.key});


  final signupController=Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return TextFormField(
        controller: signupController.passwordController.value,
        focusNode: signupController.passwordFocusNode.value,
        obscureText: signupController.showPassword.value,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Password",

          suffixIcon: IconButton(onPressed: (){
            signupController.changeShowPassowrd();
          },
              icon: signupController.showPassword.value?
              const Icon(CupertinoIcons.eye,color: AppColors.white):
              const Icon(CupertinoIcons.eye_slash,color: Colors.white,)),

          prefixIcon: Icon(Icons.lock,color: Colors.white,),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
              )
          ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Password';
          }
        },
      );
    });
  }
}
