import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController{
  final nameController=TextEditingController().obs;
  final bioController=TextEditingController().obs;
  final phoneController=TextEditingController().obs;


  Rx<File?> selectedImage = Rx<File?>(null);

  PickImage(ImageSource source) async {

    try {
      final img = await ImagePicker().pickImage(source: source,imageQuality: 80);
      if (img == null) return;
      final tempimg = File(img.path);
       selectedImage.value=tempimg;
    }
    catch(ex){
      print(ex.toString());
    }
  }
}