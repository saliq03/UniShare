
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/model/message_model/chat_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/viewmodels/services/generate_ids_service.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../model/message_model/message.dart';
import '../firebase_services/firebase_services.dart';

class ChatServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final firebaseServices=FirebaseServices();


  Stream<List<ChatModel>>getAllchats(String currentUserId) {
    return _firestore.collection('Chat_Rooms').snapshots().map((snapshot) {
      return snapshot.docs
          .where((doc) => doc.id.contains(currentUserId))
          .map((doc) => ChatModel.fromMap(doc.data()))
          .toList();
    });
  }

  Future<void> sendMessage(String receiverId,String message,String photo,String video)async {
    final currentUser=await UserPrefrences().getUser();
    final Timestamp timestamp=Timestamp.now();

    List<String> ids=[currentUser.email,receiverId];
    ids.sort();
    String chatRoomId=ids.join('_');
    String messageId=GenerateIds().generateMessageId(currentUser.email, receiverId);
     Message newMessage=Message(
         id: messageId,
         senderId: currentUser.email,
         recieverId: receiverId,
         message: message,
         photo: photo ,
         video: video,
         timeStamp: timestamp);
     ChatModel chat=ChatModel(id:  chatRoomId,
         lastMessage: message==''? '📸 Image':message,
         lastTimeStamp: timestamp,
         lastSenderId: currentUser.email,
         unreadMessages: '0');
    try {
      _firestore.collection("Chat_Rooms").doc(chatRoomId).set(
          chat.toJson());

      _firestore.collection("Chat_Rooms").doc(chatRoomId)
          .collection("Messages")
          .doc(messageId)
          .set(newMessage.toJson());
    } catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
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

  Future<String> uploadImage(XFile image,) async {
    String id=GenerateIds().generateMessageImageId();
    try{
      return await firebaseServices.uploadImage("Chat_images", id, image);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Stream<UserModel> fetchUser(String email) {
    return FirebaseFirestore.instance
        .collection("Users")
        .where("Email", isEqualTo: email)
        .snapshots()
        .map((snapshot) {
      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userData;
    });
  }

}