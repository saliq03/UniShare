import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../viewmodels/controller/home_controllers/chat_screen_controller.dart';

class PhotoSendWidget extends StatelessWidget {
   PhotoSendWidget({super.key});
  final csController=Get.put(ChatScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>csController.selectedImage.value==null?
    const SizedBox.shrink():
    Positioned(
        bottom: 90,left: 5,right: 5,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20)
              ),
              height: MediaQuery.of(context).size.height*0.6,
              width: double.infinity,

              child: Image.file(csController.selectedImage.value!,fit: BoxFit.cover,),
            ),
            Positioned(top: 0,right: 0, child: IconButton(onPressed: (){
              csController.selectedImage.value=null;
            }, icon: Icon(CupertinoIcons.xmark_circle_fill,size: 30,)))
          ],
        ))
    );



  }
}
