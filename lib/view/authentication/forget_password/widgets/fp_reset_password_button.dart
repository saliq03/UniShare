import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/viewmodels/controller/forgetpassword_controller.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../res/components/rectangle_button.dart';

class FpResetPasswordButton extends StatelessWidget {
   FpResetPasswordButton({super.key,required this.formKey});
  final GlobalKey<FormState> formKey;
  final fpController=Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return RectangleButton(title: "Reset Password", onPress: (){

        if(formKey.currentState!.validate()){
          FocusScope.of(context).unfocus();
          fpController.resetPassword();
        }


      },
        buttonColor: AppColors.black,
        titleColor: AppColors.white,
        loading: fpController.loading.value,
      );
    });


  }
}
