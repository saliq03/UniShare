import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/viewmodels/controller/home_controllers/donate_controller.dart';

class UploadImageWidget extends StatelessWidget {
   UploadImageWidget({super.key});
 final donateController=Get.put(DonateController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        donateController.PickImages();
      },
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
