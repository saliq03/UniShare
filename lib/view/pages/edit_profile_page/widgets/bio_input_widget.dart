import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../viewmodels/controller/home_controllers/edit_profile_controller.dart';

class BioInputWidget extends StatelessWidget {
   BioInputWidget({super.key});
  final epController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: epController.bioController.value,
      decoration: InputDecoration(
          labelText: "Something about you",
          labelStyle: TextStyle(color: AppColors.loginGradient2,fontSize: 18)
      ),
    );
  }
}
