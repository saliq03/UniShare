import 'package:firebase_auth/firebase_auth.dart';


class EmailverificationController {
  FirebaseAuth _auth=FirebaseAuth.instance;

   isEmailVerified(){
     if(_auth.currentUser?.emailVerified==true){
        return true;
     }
    return false;
}

  EmailNotVerified() async {
    if(!isEmailVerified()){

      await _auth.currentUser?.delete();
    }
  }
}