import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:unishare/model/message_model/call_model.dart';

class CallServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

}