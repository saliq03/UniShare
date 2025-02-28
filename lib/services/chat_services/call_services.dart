import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:unishare/model/message_model/call_model.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

import '../../model/user_model/user_model.dart';

class CallServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final  FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseServices firebaseServices=FirebaseServices();

  Future<void> sendCallNotification(CallModel call)async {
    final docRef = _firestore.collection("Notifications")
        .doc(call.receiverEmail)
        .collection("Calls")
        .doc(call.id);

    docRef.get().then((docSnapshot) {
      if (!docSnapshot.exists) {
        docRef.set(call.toJson()).then((_) {
          if (kDebugMode) {
            print("Document added successfully.");
          }
        }).catchError((error) {
          if (kDebugMode) {
            print("Failed to add document: $error");
          }
        });
      } else {
        if (kDebugMode) {
          print("Document already exists. Skipping addition.");
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("Error checking document existence: $error");
      }
    });
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
      rethrow;
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
      rethrow;
    }
  }

  endCall(CallModel call){
    try {
      _firestore.collection("Notifications").doc(call.receiverEmail)
          .collection("Calls").doc(call.id).delete();
    }
    catch(e){
      rethrow;
    }
  }

  updateCallStatus(String status,CallModel call){
    final data={"Status":status};
    _firestore.collection("Notifications").doc(call.receiverEmail)
        .collection("Calls").doc(call.id).update(data);

    _firestore.collection("Users").doc(call.callerEmail)
        .collection("Calls").doc(call.id).update(data);
    _firestore.collection("Users").doc(call.receiverEmail)
        .collection("Calls").doc(call.id).update(data);
  }

  Future<bool> isRecieverBusy(String email) async {
    final snapshot = await _firestore
        .collection("Notifications")
        .doc(email)
        .collection("Calls")
        .get();

    return snapshot.docs.isNotEmpty;
  }


  Stream<List<CallModel>>getCall(UserModel target){
    try{
      return _firestore.collection("Notifications").doc(target.email)
          .collection("Calls").snapshots().map((snapshot){
        return snapshot.docs.map((doc){
          return CallModel.fromJson(doc.data());
        }).toList();
      });
    }
    catch(e){
      rethrow;
    }

  }



}