import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';import 'package:unishare/viewmodels/controller/profile_controller.dart';

import '../../../../res/routes/routes_name.dart';

class CallButtonWidget extends StatelessWidget {
   CallButtonWidget({super.key,required this.target});
  UserModel target;
  final profileController=Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RoutesName.callingPage,arguments:{
        "caller": profileController.currentUser.value!,
        "target": target,});
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12)
        ),
        child: const Center(child: Text("Call",style: TextStyle(fontSize: 25,color: Colors.white),)),
      ),
    );
  }
}
