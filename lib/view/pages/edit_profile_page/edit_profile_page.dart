import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/colors/app_colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(CupertinoIcons.xmark,size: 30,)),
        actions: [
          TextButton(onPressed: (){}, child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.black),))
        ],
        backgroundColor: AppColors.white,
        elevation: 5,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Basic information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue,
                    ),
                    Positioned(bottom: 15,right: 25,
                        child: Icon(Icons.add_a_photo_outlined,color: Colors.white,))
                  ],
                ),
               SizedBox(width: 20,),
               Expanded(
                 child: TextFormField(
                   decoration: InputDecoration(hintText: "hinnoij"),
                 ),
               )
              ],
            )
          ],
        ),
      ),
    );
  }
}
