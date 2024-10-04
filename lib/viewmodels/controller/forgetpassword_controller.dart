import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  final emailController=TextEditingController().obs;
  final emailFocusNode= FocusNode().obs;
  final loading =true.obs;

  void changeLoading(value)=>loading.value=value;
}