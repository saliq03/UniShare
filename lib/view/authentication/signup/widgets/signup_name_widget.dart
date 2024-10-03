
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/viewmodels/controller/signup_controller.dart';

class SignupNameWidget extends StatelessWidget {
   SignupNameWidget({super.key});
   final signupController=Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupController.nameController.value,
      focusNode: signupController.nameFocusNode.value,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        hintText: "Full Name",
        prefixIcon: Icon(Icons.person,color: Colors.white,),
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
          return 'Enter full name';
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context,
            signupController.nameFocusNode.value,
            signupController.emailFocusNode.value);
      },);
  }
}
