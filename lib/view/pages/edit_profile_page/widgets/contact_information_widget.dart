import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewmodels/controller/home_controllers/edit_profile_controller.dart';

class ContactInformationWidget extends StatelessWidget {
   ContactInformationWidget({super.key});

   final epController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Contact Information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

           AbsorbPointer(
            child: TextFormField(
              controller: epController.emailController.value,
              decoration: const InputDecoration(
                  labelText: "Email",
                labelStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,fontFamily: "FiraSans",)
              ),
            ),

        )
      ],
    );
  }
}
