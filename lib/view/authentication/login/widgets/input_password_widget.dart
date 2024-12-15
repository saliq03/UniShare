
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/viewmodels/controller/login_controller.dart';

class InputPasswordWidget extends StatelessWidget {
   InputPasswordWidget({super.key});

  final loginController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return TextFormField(
        controller: loginController.passwordController.value,
        focusNode: loginController.passwordFocusNode.value,
        obscureText: loginController.showPassword.value,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Password",

          suffixIcon: IconButton(onPressed: (){
            loginController.changeShowPassword();
          },
              icon: loginController.showPassword.value?
              const Icon(CupertinoIcons.eye,color: AppColors.white):
              const Icon(CupertinoIcons.eye_slash,color: Colors.white,)),

          prefixIcon: const Icon(Icons.lock,color: Colors.white,),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2
              )
          ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Password';
          }
          return null;
        },
      );
    });
  }
}
