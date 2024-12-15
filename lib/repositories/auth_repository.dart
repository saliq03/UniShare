import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
 Future<void> signInWithEmail(String email,String password ) async {
   try{
      await FirebaseAuth.instance
         .createUserWithEmailAndPassword(
         email: email,
         password: password);
  }
  on FirebaseAuthException catch(e){
    
     throw FirebaseAuthException(code: e.code,message: e.message);
  }
  catch(e){

     if (kDebugMode) {
       print(e);
     }
  }
}

  sendVerificationEmail() async {

   try {
     _auth.currentUser?.reload();
     await _auth.currentUser?.sendEmailVerification();
   }
   catch (e){

     if (kDebugMode) {
       print(e);
     }
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

     if (kDebugMode) {
       print(e);
     }
   }
 }

  Future<void> resetPasswordwithEmail(String email) async {
   try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
   } on FirebaseAuthException catch(e){

     throw FirebaseAuthException(code: e.code,message: e.message);
   }
   catch(e){
     if (kDebugMode) {
       print(e);
     }
   }

  }

  signInWithGoogle() async {
     GoogleSignIn(
      scopes: [
        'email',
        'profile',
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/user.gender.read', // Required for gender info
      ],
    );
    try{
      final GoogleSignInAccount? guser= await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gauth=await guser!.authentication;
      final crediential=GoogleAuthProvider.credential(
          accessToken: gauth.accessToken,
          idToken: gauth.idToken
      );
      UserCredential result= await FirebaseAuth.instance.signInWithCredential(crediential);
      result.user;


    }catch(e){

      if (kDebugMode) {
        print(e.toString());
      }
    }

  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow; // Optionally handle or rethrow the exception
    }
  }

  }