import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

class EditProfileRepository{
   FirebaseServices firebaseServices =FirebaseServices();
 Future<void> updateUser(UserModel user) async {
    Map<String,dynamic> data={
      "Name":user.name,
      "Bio":user.bio,
      "Photo":user.photo,
    };
    try{
      firebaseServices.updateData("Users", user.email, data);
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
 }

  Future<String> uploadProfileImage(XFile image,String email) async {
    String id="profile$email";
    try{
      return await firebaseServices.uploadImage("Profile_images", id, image);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

}