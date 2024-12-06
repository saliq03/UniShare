import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
     _auth.currentUser?.reload();
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

  Future<void> resetPasswordwithEmail(String email) async {
   try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
   } on FirebaseAuthException catch(e){

     throw FirebaseAuthException(code: e.code,message: e.message);
   }
   catch(e){
     print("Unknown error occured while signup");
     print(e);
   }

  }

  SignInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
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

      User? userDetails=result.user;

      //we will return userdetails and gender in a map here

    }catch(e){
      print('Error in signin with google');
      print(e.toString());
    }

  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      print('User logged out successfully');
    } catch (e) {
      print('Error logging out: $e');
      throw e; // Optionally handle or rethrow the exception
    }
  }

  }