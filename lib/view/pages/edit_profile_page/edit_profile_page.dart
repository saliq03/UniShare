import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/view/pages/edit_profile_page/widgets/bio_input_widget.dart';
import 'package:unishare/view/pages/edit_profile_page/widgets/contact_information_widget.dart';
import 'package:unishare/view/pages/edit_profile_page/widgets/photo_name_widget.dart';

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
            SizedBox(height: 20,),
            PhotoNameWidget(),
            SizedBox(height: 20,),
            BioInputWidget(),
            SizedBox(height: 40,),
            Divider(),
            SizedBox(height: 10,),
            ContactInformationWidget()
          ],
        ),
      ),
    );
  }
}
