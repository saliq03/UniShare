import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/viewmodels/controller/signup_controller.dart';

class SignupInputEmailWidget extends StatelessWidget {
   SignupInputEmailWidget({super.key});


  final signupController=Get.put(SignupController());
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: signupController.emailController.value,
      focusNode: signupController.emailFocusNode.value,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: "Email",
        prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'Enter Email';
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context,
            signupController.emailFocusNode.value,
            signupController.passwordFocusNode.value);
      },
    );
  }
}
