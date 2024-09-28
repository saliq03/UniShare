import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/components/my_text_button.dart';
import 'package:unishare/res/routes/routes_name.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Already have an account?",style: TextStyle(color: Colors.white,fontSize: 18),),
          MyTextButton(title: "Sign In", onPress: (){
            Get.offNamed(RoutesName.loginview);
          },fontSize: 19,)
        ],
      );
  }
}