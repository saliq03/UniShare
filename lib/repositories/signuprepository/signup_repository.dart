import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:unishare/res/assets/images_assets.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';
import 'package:unishare/services/notification_services/notification_service.dart';

class SignupRepository{

  final firebaseServices=FirebaseServices();
  uploadUser({required String name,required String email,required String gender,String photo = ImagesAssets.defaultProfileImage}) async {
    String token=await NotificationServices().getDeviceToken();
    Map<String,dynamic> userdata={
      "Name":name,
      "Email":email,
      "Gender":gender,
      "Bio": '',
      "Photo":photo,
      "FCM Token":token
    };

    try{
      await firebaseServices.uploadData("Users", email, userdata);

    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
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
      rethrow;
    }
  }
}