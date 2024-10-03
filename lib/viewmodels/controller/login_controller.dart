import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/utils/utils.dart';

class LoginController extends GetxController{
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
       await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: emailController.value.text,
           password: passwordController.value.text);
       Utils.snackBar("succesfull", "Logged in");
       // changeLoading(false);
     } on FirebaseAuthException catch (ex) {
       changeLoading(false);
       Get.snackbar(ex.code, ex.message.toString(),duration: Duration(seconds: 5));
       print("Error code:"+ex.code);
       print("Error message"+ex.message.toString());
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