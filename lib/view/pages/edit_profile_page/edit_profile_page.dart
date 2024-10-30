import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/view/pages/edit_profile_page/widgets/bio_input_widget.dart';
import 'package:unishare/view/pages/edit_profile_page/widgets/contact_information_widget.dart';
import 'package:unishare/view/pages/edit_profile_page/widgets/photo_name_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/edit_profile_controller.dart';

import '../../../utils/utils.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final epController=Get.put(EditProfileController());



  @override
  void initState() {
    super.initState();
    epController.initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    String profileImage=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(CupertinoIcons.xmark,size: 30,)),
        actions: [
          Obx((){
           return epController.loading.value?
               CircularProgressIndicator():
           TextButton(onPressed: (){
             epController.saveUserDetails().then((value){
               Get.back();
               Utils.snackBar("Updated", "Profile edited sucessfully");
             });
           }, child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.black),),
           ) ;
          })

        ],
        backgroundColor: AppColors.white,
        elevation: 5,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 30),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Basic information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                PhotoNameWidget(initImage: profileImage,),
                const SizedBox(height: 20,),
                BioInputWidget(),
                const SizedBox(height: 40,),
                const Divider(),
                const SizedBox(height: 10,),
                ContactInformationWidget()
              ],
            ),
          ),
          Obx(() {
            return epController.loading.value
                ? Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
