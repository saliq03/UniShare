import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:unishare/model/message_model/call_model.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

class CallServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final  FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseServices firebaseServices=FirebaseServices();

  Future<void> sendCallNotification(CallModel call)async {
    try {
      _firestore.collection("Notifications").doc(call.receiverEmail)
          .collection("Calls").doc(call.id).set(call.toJson());
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      throw e;
    }
  }

  Stream<List<CallModel>>getCallNotification(){
    try{
      return _firestore.collection("Notifications").doc(_auth.currentUser!.email)
          .collection("Calls").snapshots().map((snapshot){
            return snapshot.docs.map((doc){
              return CallModel.fromJson(doc.data());
            }).toList();
      });
    }
    catch(e){
      throw e;
    }

  }

  saveCalls(CallModel call){
    try {
      // saving call in caller
      _firestore.collection("Users").doc(call.callerEmail)
          .collection("Calls").doc(call.id).set(call.toJson());
      // saving call in reciever
      _firestore.collection("Users").doc(call.receiverEmail)
          .collection("Calls").doc(call.id).set(call.toJson());
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      throw e;
    }
  }

  endCall(CallModel call){
    try {
      _firestore.collection("Notifications").doc(call.receiverEmail)
          .collection("Calls").doc(call.id).delete();
    }
    catch(e){
      throw e;
    }
  }

}