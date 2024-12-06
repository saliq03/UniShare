import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/repositories/edit_profile_repository/edit_profile_repository.dart';
import 'package:unishare/viewmodels/controller/bottom_nav_controller.dart';

import 'package:unishare/viewmodels/controller/home_controllers/sidebar_controller.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

class EditProfileController extends GetxController{
  final editProfileRepo=EditProfileRepository();
  final userPrefrences=UserPrefrences();

  final nameController=TextEditingController().obs;
  final bioController=TextEditingController().obs;
  final phoneController=TextEditingController().obs;
  var initialImage='';
  final loading =false.obs;


  Rx<File?> selectedImage = Rx<File?>(null);

  initializeControllers() async {
    final user= await userPrefrences.GetUser();
    initialImage=user.Photo;
    nameController.value.text=user.Name;
    bioController.value.text=user.Bio;

  }

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

 Future<void> saveUserDetails() async {
    loading.value=true;
    final user=await userPrefrences.GetUser();
    if(selectedImage.value == null){
      UserModel userModel=UserModel(
              Photo: user.Photo,
              Bio: bioController.value.text,
              Name: nameController.value.text,
              Email: user.Email,
              Gender: user.Gender,
              Status: user.Status);
      editProfileRepo.UpdateUser(userModel).then((value){
        UserModel userModel=UserModel(Photo: user.Photo, Bio:bioController.value.text , Name: nameController.value.text, Email: user.Email, Gender: user.Gender,Status: user.Status);
        userPrefrences.SaveUser(userModel).then((data){
          Get.find<SidebarController>().refreshController();

          Get.back();
        });
        loading.value=false;
      });
    }
    else{
      final xFile = XFile(selectedImage.value!.path);
      editProfileRepo.UploadProfileImage(xFile, user.Email).then((value){
        UserModel userModel=UserModel(
            Photo: value,
            Bio: bioController.value.text,
            Name: nameController.value.text,
            Email: user.Email,
            Gender: user.Gender,
            Status: user.Status);
        editProfileRepo.UpdateUser(userModel).then((v){
          UserModel userModel=UserModel(Photo: value, Bio:bioController.value.text , Name: nameController.value.text, Email: user.Email, Gender: user.Gender,Status: user.Status);

          userPrefrences.SaveUser(userModel).then((data){
            Get.find<SidebarController>().refreshController();
            Get.find<BottomNavController>().loadDataFromPref();
            Get.back();
            loading.value=false;
          });

        });
      });

    }



 }
}