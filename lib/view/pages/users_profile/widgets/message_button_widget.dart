import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/routes/routes_name.dart';

class MessageButtonWidget extends StatelessWidget {
  const MessageButtonWidget({required this.user,super.key});
final UserModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RoutesName.chatScreen,arguments: user);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
        margin: EdgeInsets.only(left: 30,top: 20),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Text("Message",style: TextStyle(fontSize: 25,color: Colors.white),),
      ),
    );
  }
}
