import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unishare/utils/utils.dart';
import 'package:unishare/viewmodels/controller/login_controller.dart';

class InputEmailWidget extends StatelessWidget {
   InputEmailWidget({super.key});

  final loginController=Get.put(LoginController());
   final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: loginController.emailController.value,
      focusNode: loginController.emailFocusNode.value,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        hintText: "Email",
        prefixIcon: const Icon(Icons.email_outlined,color: Colors.white,),
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
          return 'Enter Email';
        }
        else if(!emailRegex.hasMatch(value)) {
          return "Enter valid Email";
        }
        return null;
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context,
            loginController.emailFocusNode.value,
            loginController.passwordFocusNode.value);
      },
    );
  }
}
