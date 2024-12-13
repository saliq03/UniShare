import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/viewmodels/controller/home_controllers/call_controller.dart';

class EndCallButton extends StatelessWidget {
   EndCallButton({super.key});
  final callController=Get.put(CallController());
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        callController.cancelCall();
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.red,
        child: Icon(Icons.call_end_sharp,color: Colors.white,size: 30,),
      ),
    );
  }
}
