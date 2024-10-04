import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/routes/routes_name.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/rectangle_button.dart';

class FpResetPasswordButton extends StatelessWidget {
   FpResetPasswordButton({super.key,required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return  RectangleButton(title: "Reset Password", onPress: (){
      Get.offNamed(RoutesName.afterForgetPasswordScreen);
    },
      buttonColor: AppColors.black,
      titleColor: AppColors.white,
    );
  }
}
