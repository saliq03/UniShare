import 'package:firebase_auth/firebase_auth.dart';


class EmailverificationController {
  final FirebaseAuth _auth=FirebaseAuth.instance;

   isEmailVerified(){
     if(_auth.currentUser?.emailVerified==true){
        return true;
     }
    return false;
}

  emailNotVerified() async {
    if(!isEmailVerified()){

      await _auth.currentUser?.delete();
    }
  }
}