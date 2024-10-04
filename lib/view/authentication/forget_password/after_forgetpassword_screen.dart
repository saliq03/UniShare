import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/components/rectangle_button.dart';

class AfterForgetpasswordScreen extends StatefulWidget {
  const AfterForgetpasswordScreen({super.key});

  @override
  State<AfterForgetpasswordScreen> createState() => _AfterForgetpasswordScreenState();
}

class _AfterForgetpasswordScreenState extends State<AfterForgetpasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Check your email", style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
            SizedBox(height: 20,width: double.infinity,),
            Image.asset(IconsAssets.tickedCircle,width: 150,),
            SizedBox(height: 30,),
            const Text("We have sent you a reset password link on your registered email address.",
              textAlign: TextAlign.center,style: TextStyle(fontSize: 19),),
            const SizedBox(height: 40,),
            RectangleButton(title: "Go to Login", onPress: (){
              Get.back();
            },
            buttonColor: AppColors.black,
            titleColor: AppColors.white,
            width: 200,
            height: 50,)


          ],
        ),
      ),
    );
  }
}
