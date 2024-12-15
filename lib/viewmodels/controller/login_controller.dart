
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/repositories/auth_repository.dart';
import 'package:unishare/repositories/login_repository/login_repository.dart';
import 'package:unishare/repositories/signuprepository/signup_repository.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/utils/utils.dart';

import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';



class LoginController extends GetxController{

  final signUpRepository=SignupRepository();
  final authRepository =AuthRepository();
  final userPrefrences=UserPrefrences();

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;

  final emailFocusNode= FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;
  final loading=false.obs;
  final showPassword=true.obs;
  final continuewithgoogleLoading=false.obs;

  void changeLoading(value)=>loading.value=value;
  void changeShowPassword(){
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
       await authRepository.logInWithEmailPassword(emailController.value.text, passwordController.value.text).then((value) async {
         userPrefrences.setLoginKey(true);
         await LoginRepository().fetchUser(emailController.value.text).then((user){
           userPrefrences.saveUser(user);
           Get.offNamed(RoutesName.homeBottomNav);
           Utils.snackBar("succesfull", "Logged in");
         });

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

   logInWithGoogle() async {
     continuewithgoogleLoading.value=true;

    try{
      final GoogleSignInAccount? guser= await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gauth=await guser!.authentication;
      final crediential=GoogleAuthProvider.credential(
          accessToken: gauth.accessToken,
          idToken: gauth.idToken
      );
      UserCredential result= await FirebaseAuth.instance.signInWithCredential(crediential);

      User? userDetails=result.user;

      if (kDebugMode) {
        print(result);
      }


      if(result!=null){
        signUpRepository.ifUserExists(userDetails!.email!).then((userDoc){
          userPrefrences.setLoginKey(true);
          if(!userDoc.exists){
            SignupRepository().uploadUser(name: userDetails.displayName!, email: userDetails.email!,gender: 'Unknown', photo: userDetails!.photoURL!);
            UserModel userModel=UserModel(photo:userDetails.photoURL!, bio: '', name: userDetails.displayName!, email: userDetails.email!, gender: 'Unknown', status: 'online');
            userPrefrences.saveUser(userModel).then((value)=>Get.offNamed(RoutesName.homeBottomNav));
          }
          else{
            LoginRepository().fetchUser(userDetails.email!).then((user){
              userPrefrences.saveUser(user).then((value)=>Get.offNamed(RoutesName.homeBottomNav));
            });}
        });
      }
      continuewithgoogleLoading.value=false;
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
     continuewithgoogleLoading.value=false;




   }






}