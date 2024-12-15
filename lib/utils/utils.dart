import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:unishare/res/colors/app_colors.dart';

class Utils{
  static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: AppColors.white,
    textColor: AppColors.red,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 16,
    gravity: ToastGravity.CENTER);

  }

  static snackBar(String title,String message){
    Get.snackbar(title, message,
      duration: const Duration(seconds: 1),
      // snackPosition:SnackPosition.TOP
    );
  }
}