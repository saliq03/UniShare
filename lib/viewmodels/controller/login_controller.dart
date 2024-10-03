import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/repositories/auth_repository.dart';
import 'package:unishare/utils/utils.dart';

class LoginController extends GetxController{
  final authRepository =AuthRepository();

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;

  final emailFocusNode= FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;
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

   Future<void> login() async {
     changeLoading(true);
     try {
       await authRepository.logInWithEmailPassword(emailController.value.text, passwordController.value.text).then((value){
         Utils.snackBar("succesfull", "Logged in");
       });

     } on FirebaseAuthException catch (ex) {
       // changeLoading(false);
       Get.snackbar(ex.code, ex.message.toString(),duration: Duration(seconds: 5));

       switch (ex.code) {
         case 'wrong-password':
           Utils.toastMessage("Incorrect password");
           break;
         case 'user-not-found':
           Utils.toastMessage("No user found with this email");
           break;
         case 'invalid-email':
           Utils.toastMessage("The email address is badly formatted");
           break;
         case 'user-disabled':
           Utils.toastMessage("This account has been disabled");
           break;
         case 'too-many-requests':
           Utils.toastMessage("Too many attempts. Try again later.");
           break;
         default:
           Utils.toastMessage("Login failed. Please try again.");
           break;
       }
     }finally {

       changeLoading(false);
     }
   }



}