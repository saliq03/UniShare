import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../viewmodels/controller/home_controllers/productpage_controller.dart';

class PostedbyWidget extends StatelessWidget {
   PostedbyWidget({ required this.postedOn,super.key});
  final String postedOn;
   final controller=Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Divider(color: Colors.black26,thickness: 3,),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                  color: AppColors.loginGradient1
              )
          ),

          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red,

              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Posted by"),
                  Obx((){
                    return  controller.owner.value==null?Container():Text(controller.owner.value!.Name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
                  }),
                  Text("Posted on: $postedOn")
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
