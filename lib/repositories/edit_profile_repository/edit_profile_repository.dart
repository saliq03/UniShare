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
    try{
      firebaseServices.updateData("Users", user.Email, data);
    }
    catch(e){
      print(e.toString());
    }
 }

  Future<String> UploadProfileImage(XFile image,String email) async {
    String id="profile$email";
    try{
      return await firebaseServices.uploadImage("Profile_images", id, image);
    }catch(e){
      print(e.toString());
      throw e;
    }
  }

}