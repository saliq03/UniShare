import 'package:unishare/services/firebase_services/firebase_services.dart';

class SignupRepository{

  final firebaseServices=FirebaseServices();
  uploadUser(String name,String email,String gender) async {
    Map<String,dynamic> userdata={
      "Name":name,
      "Email":email,
      "Gender":gender
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
}