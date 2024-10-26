import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unishare/repositories/auth_repository.dart';
import 'package:unishare/repositories/login_repository/login_repository.dart';
import 'package:unishare/repositories/signuprepository/signup_repository.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';


class LoginController extends GetxController{
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
       await authRepository.logInWithEmailPassword(emailController.value.text, passwordController.value.text).then((value) async {
         userPrefrences.SetLoginKey(true);
         await LoginRepository().fetchUser(emailController.value.text).then((user){
           userPrefrences.SaveUser(user.Name, user.Email, user.Gender,user.Photo);
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
     final GoogleSignIn googleSignIn = GoogleSignIn(
       scopes: [
         'email',
         'profile',
         'https://www.googleapis.com/auth/userinfo.profile',
         'https://www.googleapis.com/auth/user.gender.read', // Required for gender info
       ],
     );

    try{
      final GoogleSignInAccount? guser= await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gauth=await guser!.authentication;
      final crediential=GoogleAuthProvider.credential(
          accessToken: gauth.accessToken,
          idToken: gauth.idToken
      );
      UserCredential result= await FirebaseAuth.instance.signInWithCredential(crediential);

      User? userDetails=result.user;
      String gender=fetchUserGender(gauth.accessToken!);
      continuewithgoogleLoading.value=false;
      Utils.snackBar("Success", "sign in with google");
      print('value of result');
      print(result);

      if(result!=null){
       SignupRepository().uploadUser(userDetails!.displayName!,
           userDetails.email!,gender);
      }
    }
    catch(e){
      print('Error in signin with google');
      print(e.toString());
    }
     continuewithgoogleLoading.value=false;




   }


   fetchUserGender(String accessToken) async {

    try{
      final url = Uri.parse('https://people.googleapis.com/v1/people/me?personFields=genders');

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("User Gender: ${data['genders'][0]['value']}");
        return data['genders'][0]['value'];
      } else {
        print("Failed to fetch gender info: ${response.body}");
      }
    } catch(e){
      print("error in fetchuserGender");
      print(e.toString());
    }
    return null;
    }





}