import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unishare/utils/utils.dart';

class SignupController extends GetxController{
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  final nameController=TextEditingController().obs;
  final confirmPasswordController=TextEditingController().obs;

  final emailFocusNode= FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;
  final nameFocusNode=FocusNode().obs;
  final confirmPasswordFocusNode=FocusNode().obs;
  final loading=false.obs;
  final showPassword=true.obs;

  void changeLoading(value)=>loading.value=value;
  void changeShowPassowrd(){
    if(showPassword.value==false){
      showPassword.value=true;
    }
    else{
      showPassword.value=false;
    }
  }

   Signup() async {
    changeLoading(true);
    try{
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text);
      changeLoading(false);
    }
    on FirebaseAuthException catch (ex) {
      changeLoading(false);
      if (ex.code == "weak-password") {

        Utils.toastMessage("Weak Password");
      }
      if(ex.code=="email-already-in-use"){

       Utils.toastMessage("User already exist");
      }
    }

  }
}