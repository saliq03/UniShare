import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
 Future<void> signInWithEmail(String email,String password ) async {
   try{
     UserCredential userCredential = await FirebaseAuth.instance
         .createUserWithEmailAndPassword(
         email: email,
         password: password);
  }
  on FirebaseAuthException catch(e){
    
     throw FirebaseAuthException(code: e.code,message: e.message);
  }
  catch(e){
     print("Unknown error occured while signup");
     print(e);
  }
}

  sendVerificationEmail() async {
   try {
     await _auth.currentUser?.sendEmailVerification();
   }
   catch (e){
     print("error while sending verification email\n");
     print(e);
   }
 }

  Future<void> logInWithEmailPassword(String email,String password)async{
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password);
   }
   on FirebaseAuthException catch(e){

     throw FirebaseAuthException(code: e.code,message: e.message);
   }
   catch(e){
     print("Unknown error occured while signup");
     print(e);
   }
 }
  }