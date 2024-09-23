import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/components/my_text_button.dart';
import 'package:unishare/res/routes/routes_name.dart';

class SignupRow extends StatelessWidget {
  const SignupRow({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Don't have an account?",style: TextStyle(color: Colors.white,fontSize: 18),),
          MyTextButton(title: "Sign Up", onPress: (){
            Get.toNamed(RoutesName.signupview);
          },fontSize: 19,)
        ],
      );
  }
}
