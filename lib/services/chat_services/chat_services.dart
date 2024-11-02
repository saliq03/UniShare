
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../model/message_model/message.dart';

class ChatServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<String>>getAllchats(String currentUserId) {
    return _firestore.collection('Chat_Rooms').snapshots().map((snapshot) {
      return snapshot.docs
          .where((doc) => doc.id.contains(currentUserId))
          .map((doc) => doc.id)
          .toList();
    });
  }

  Future<void> sendMessage(String receiverId,String message)async {
    print("in services method");
    final currentUser=await UserPrefrences().GetUser();
    final Timestamp timestamp=Timestamp.now();

    List<String> ids=[currentUser.Email,receiverId];
    ids.sort();
    String chatRoomId=ids.join('_');
     Message newMessage=Message(
         senderId: currentUser.Email,
         recieverId: receiverId,
         message: message,
         timeStamp: timestamp);
    try {
      _firestore.collection("Chat_Rooms").doc(chatRoomId).set(
          {"Id": chatRoomId});
      _firestore.collection("Chat_Rooms").doc(chatRoomId)
          .collection("Messages")
          .add(newMessage.toJson());
    } catch(e){
      print(e.toString());
    }
    }

  Stream<QuerySnapshot> getMessage(String senderId,String recieverId){
    List<String> ids=[senderId,recieverId];
    ids.sort();
    String chatRoomId=ids.join('_');
    return _firestore.collection("Chat_Rooms").
    doc(chatRoomId).
    collection("Messages").
    orderBy("TimeStamp",descending: false).
    snapshots();
  }

  }