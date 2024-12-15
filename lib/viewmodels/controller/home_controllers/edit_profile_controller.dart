import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  final emailController=TextEditingController().obs;
  var initialImage='';
  final loading =false.obs;


  Rx<File?> selectedImage = Rx<File?>(null);

  initializeControllers() async {
    final user= await userPrefrences.getUser();
    initialImage=user.photo;
    nameController.value.text=user.name;
    bioController.value.text=user.bio;
    emailController.value.text=user.email;

  }

  pickImage(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source,imageQuality: 80);
      if (img == null) return;
      final tempimg = File(img.path);
       selectedImage.value=tempimg;
    }
    catch(ex){
      if (kDebugMode) {
        print(ex.toString());
      }
    }
  }

 Future<void> saveUserDetails() async {
    loading.value=true;
    final user=await userPrefrences.getUser();
    if(selectedImage.value == null){
      UserModel userModel=UserModel(
              photo: user.photo,
              bio: bioController.value.text,
              name: nameController.value.text,
              email: user.email,
              gender: user.gender,
              status: user.status);
      editProfileRepo.updateUser(userModel).then((value){
        UserModel userModel=UserModel(photo: user.photo, bio:bioController.value.text , name: nameController.value.text, email: user.email, gender: user.gender,status: user.status);
        userPrefrences.saveUser(userModel).then((data){
          Get.find<SidebarController>().refreshController();

          Get.back();
        });
        loading.value=false;
      });
    }
    else{
      final xFile = XFile(selectedImage.value!.path);
      editProfileRepo.uploadProfileImage(xFile, user.email).then((value){
        UserModel userModel=UserModel(
            photo: value,
            bio: bioController.value.text,
            name: nameController.value.text,
            email: user.email,
            gender: user.gender,
            status: user.status);
        editProfileRepo.updateUser(userModel).then((v){
          UserModel userModel=UserModel(photo: value, bio:bioController.value.text , name: nameController.value.text, email: user.email, gender: user.gender,status: user.status);

          userPrefrences.saveUser(userModel).then((data){
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