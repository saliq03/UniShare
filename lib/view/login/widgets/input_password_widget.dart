import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/viewmodels/controller/login_controller.dart';

class InputPasswordWidget extends StatelessWidget {
   InputPasswordWidget({super.key});

  final loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.passwordController.value,
      focusNode: loginController.passwordFocusNode.value,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: "Password",
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
  }
}
