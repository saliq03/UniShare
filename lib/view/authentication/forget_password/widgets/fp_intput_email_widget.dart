import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/viewmodels/controller/forgetpassword_controller.dart';

class FpIntputEmailWidget extends StatelessWidget {
   FpIntputEmailWidget({super.key});

  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
 final fpController=Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      child: TextFormField(
        controller:fpController.emailController.value,
        focusNode: fpController.emailFocusNode.value,
        style: TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Email",
          prefixIcon: Icon(Icons.email_outlined,size: 30,),
          enabledBorder: OutlineInputBorder(

              borderSide: BorderSide(
                  width: 2
              )),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
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
        },
        onFieldSubmitted: (value){
          fpController.emailFocusNode.value.unfocus();
        },
      ),
    );
  }
}
