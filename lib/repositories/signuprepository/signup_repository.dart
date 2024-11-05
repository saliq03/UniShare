import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unishare/res/assets/images_assets.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

class SignupRepository{

  final firebaseServices=FirebaseServices();
  uploadUser({required String name,required String email,required String gender,String photo = ImagesAssets.defaultProfileImage}) async {
    Map<String,dynamic> userdata={
      "Name":name,
      "Email":email,
      "Gender":gender,
      "Bio": '',
      "Photo":photo
    };

    try{
      await firebaseServices.uploadData("Users", email, userdata);
      print("user uploaded");
    }
    catch(e){
      print("error in uploaduser");
      print(e);
    }

  }

  Future<DocumentSnapshot> ifUserExists(String email) async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(email)
          .get();
      return userDoc;
    }
    catch (e){
      print(e.toString());
      throw e;
    }
  }
}