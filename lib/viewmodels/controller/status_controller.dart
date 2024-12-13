
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

class StatusController extends GetxController with WidgetsBindingObserver{
 final _auth =FirebaseAuth.instance;

 final firebaseServices=FirebaseServices();

 @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    firebaseServices.updateData("Users", _auth.currentUser!.email!, {
      "Status": 'Online'
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
     if(state==AppLifecycleState.inactive){
        firebaseServices.updateData("Users", _auth.currentUser!.email!, {
          "Status": 'Offline'
        });
     }
     else if(state==AppLifecycleState.resumed){
       firebaseServices.updateData("Users", _auth.currentUser!.email!, {
         "Status": 'Online'
       });
     }

  }

  @override
  void onClose() {
   WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}