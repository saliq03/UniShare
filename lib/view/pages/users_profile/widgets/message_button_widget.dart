import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        width: 160,
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12)
        ),
        child: const Center(child: Text("Message",style: TextStyle(fontSize: 25,color: Colors.white),)),
      ),
    );
  }
}
