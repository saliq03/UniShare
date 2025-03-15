import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final String lastMessage;
  final Timestamp lastTimeStamp;
  final String lastSenderId;
  final String unreadMessages;

  ChatModel(
      {required this.id, required this.lastMessage, required this.lastTimeStamp, required this.lastSenderId,
        required this.unreadMessages});

  toJson() {
    return { "Id": id,
      "Last_Message": lastMessage,
      "Last_TimeStamp": lastTimeStamp,
      "Last_SenderId": lastSenderId,
      "Unread_Messages": unreadMessages}; }

  factory ChatModel.fromMap(Map<String, dynamic> json) {
    return ChatModel(
        id: json["Id"],
        lastMessage: json["Last_Message"],
        lastTimeStamp: json["Last_TimeStamp"],
        lastSenderId: json["Last_SenderId"],
        unreadMessages: json["Unread_Messages"]);
  }
}