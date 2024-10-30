import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

class EditProfileRepository{
   FirebaseServices firebaseServices =FirebaseServices();
 Future<void> UpdateUser(UserModel user) async {
    Map<String,dynamic> data={
      "Name":user.Name,
      "Bio":user.Bio,
      "Photo":user.Photo,
    };
    firebaseServices.updateData("Users", user.Email, data);
  }

  Future<String> UploadProfileImage(XFile image,String email) async {
    String id="profile$email";
     return await firebaseServices.uploadImage("Product_images", id, image);
  }

}