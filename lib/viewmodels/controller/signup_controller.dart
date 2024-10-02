import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unishare/repositories/auth_repository.dart';

import 'package:unishare/utils/utils.dart';

import '../../res/constants/constants.dart';
import '../../res/routes/routes_name.dart';

class SignupController extends GetxController{
  final authRepository =AuthRepository();

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  final nameController=TextEditingController().obs;
  final confirmPasswordController=TextEditingController().obs;
  var gender=Constants.male.obs;

  final emailFocusNode= FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;
  final nameFocusNode=FocusNode().obs;
  final genderFocusNode=FocusNode().obs;
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

   Signup(BuildContext context) async {
    changeLoading(true);
    try{
      await authRepository.signInWithEmail(emailController.value.text, passwordController.value.text);
       await authRepository.sendVerificationEmail();
      changeLoading(false);
      Get.toNamed(RoutesName.emailverification,
          arguments: {
           "Name" :nameController.value.text,
           "Email" :emailController.value.text,
            "Gender" :gender.value
          });



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