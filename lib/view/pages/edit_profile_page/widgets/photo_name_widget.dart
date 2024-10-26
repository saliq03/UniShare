import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/view/pages/edit_profile_page/edit_profile_page.dart';
import 'package:unishare/viewmodels/controller/home_controllers/edit_profile_controller.dart';

import '../../../../res/colors/app_colors.dart';

class PhotoNameWidget extends StatelessWidget {
   PhotoNameWidget({super.key});

  final epController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Row(
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
            controller: epController.nameController.value,
            decoration: const InputDecoration(
                labelText: "Enter your name",
                labelStyle: TextStyle(color:AppColors.loginGradient2 )),
          ),
        )
      ],
    );
  }
}
