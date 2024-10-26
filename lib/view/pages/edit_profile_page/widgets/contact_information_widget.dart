import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../viewmodels/controller/home_controllers/edit_profile_controller.dart';

class ContactInformationWidget extends StatelessWidget {
   ContactInformationWidget({super.key});

   final epController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Contact Information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: epController.phoneController.value,
              decoration: InputDecoration(
                  labelText: "Phone Number"
              ),
            ),
          ),
        )
      ],
    );
  }
}
