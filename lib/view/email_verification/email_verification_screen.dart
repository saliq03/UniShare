import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/view/email_verification/widgets/writing_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
 late String email;
 @override
  void initState() {
    super.initState();
    email=Get.arguments as String;

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconsAssets.email,height: 100,),
           WritingWidget(email: email),
            RoundButton(title: "Resend Email", onPress: (){

            },width: 200,
            buttonColor: Colors.green,titleColor: Colors.white,)


          ],
        ),
      ),
    );
  }
}
