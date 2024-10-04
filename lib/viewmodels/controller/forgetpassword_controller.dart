import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/utils/utils.dart';

import '../../repositories/auth_repository.dart';
import '../../res/routes/routes_name.dart';

class ForgetPasswordController extends GetxController{
  final authRepository =AuthRepository();

  final emailController=TextEditingController().obs;
  final emailFocusNode= FocusNode().obs;
  final loading =false.obs;

  void changeLoading(value)=>loading.value=value;

  resetPassword() async {
    changeLoading(true);
    try{
      //here we have to put logic for when user not found in the useres list
      //we will do that by fetching data from users repo
      authRepository.resetPasswordwithEmail(emailController.value.text).then((value){
        Get.offNamed(RoutesName.afterForgetPasswordScreen);

      });
      changeLoading(false);

    }on FirebaseAuthException catch(ex){
      if(ex.code=='user-not-found'){
        Utils.toastMessage("User not found");
      }
      else if (ex.code == 'invalid-email'){
        Utils.toastMessage("Invalid Email");
      }
    }finally{
      changeLoading(false);
    }
  }
}