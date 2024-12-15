import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/utils/utils.dart';

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
        obscureText: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Password",

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
        onFieldSubmitted: (value){
          Utils.fieldFocusChange(context,
              signupController.passwordFocusNode.value,
              signupController.confirmPasswordFocusNode.value);
        },
      );
    });
  }
}
