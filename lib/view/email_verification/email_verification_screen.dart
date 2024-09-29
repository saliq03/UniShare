import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconsAssets.email,height: 100,),
            SizedBox(height: 10,width: double.infinity,),
            Text("Please verify your email",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("you're almost there!We sent an email to",style: TextStyle(fontSize: 16),),
            Text("javidsaliq@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Text("just click on the link in that email to complete your signup.",style: TextStyle(fontSize: 16),),

          ],
        ),
      ),
    );
  }
}
