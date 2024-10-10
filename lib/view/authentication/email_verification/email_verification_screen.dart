import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:unishare/repositories/auth_repository.dart';
import 'package:unishare/repositories/signuprepository/signup_repository.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/authentication/email_verification/widgets/writing_widget.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../viewmodels/controller/emailverification_controller.dart';


class EmailVerificationScreen extends StatefulWidget {
   const EmailVerificationScreen({super.key});
  // final String email;
  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

 FirebaseAuth _auth=FirebaseAuth.instance;
late Map<String,dynamic> args;
 final authRepository=AuthRepository();
 final emailVerificationController=EmailverificationController();
 final signupRepository=SignupRepository();
 final userPrefrences= UserPrefrences();

 late Timer timer;
 @override
  void initState() {
    super.initState();
    args=Get.arguments;

    timer=Timer.periodic(Duration(seconds: 3), (timer){
      _auth.currentUser?.reload();
      if(emailVerificationController.isEmailVerified()){
        signupRepository.uploadUser(args['Name'], args['Email'], args['Gender']);
        userPrefrences.SetLoginKey(true);
        userPrefrences.SaveUser(args['Name'],args['Email'], args['Gender']);
        Get.offNamed(RoutesName.homeBottomNav);
      }
    });
 }

 @override
  void dispose() {
    timer.cancel();
    super.dispose();
    emailVerificationController.EmailNotVerified();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconsAssets.email,height: 100,),
           WritingWidget(email: args['Email']),
            RoundButton(title: "Resend Email", onPress: () async {
             await authRepository.sendVerificationEmail();
            },width: 200,
            buttonColor: Colors.green,titleColor: Colors.white,),



          ],
        ),
      ),
    );
  }
}
