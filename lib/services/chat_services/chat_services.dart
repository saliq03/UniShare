
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unishare/model/message_model/chat_model.dart';
import 'package:unishare/viewmodels/services/generate_ids_service.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../model/message_model/message.dart';

class ChatServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatModel>>getAllchats(String currentUserId) {
    return _firestore.collection('Chat_Rooms').snapshots().map((snapshot) {
      return snapshot.docs
          .where((doc) => doc.id.contains(currentUserId))
          .map((doc) => ChatModel.fromMap(doc.data()))
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
    String messageId=GenerateIds().GeneratMessageId(currentUser.Email, receiverId);
     Message newMessage=Message(
         id: messageId,
         senderId: currentUser.Email,
         recieverId: receiverId,
         message: message,
         timeStamp: timestamp);
     ChatModel chat=ChatModel(id:  chatRoomId,
         lastMessage: message,
         lastTimeStamp: timestamp,
         lastSenderId: currentUser.Email,
         unreadMessages: '0');
    try {
      _firestore.collection("Chat_Rooms").doc(chatRoomId).set(
          chat.toJson());

      _firestore.collection("Chat_Rooms").doc(chatRoomId)
          .collection("Messages")
          .doc(messageId)
          .set(newMessage.toJson());
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