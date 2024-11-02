import 'package:cloud_firestore/cloud_firestore.dart';

class Message{

  final String senderId;
  final String recieverId;
  final String message;
  final Timestamp timeStamp;

  Message( {
    required  this.senderId,
    required this.recieverId,
    required this.message,
    required this.timeStamp,
   });

  toJson(){
    return {"SenderId":senderId, "RecieverId":recieverId, "Message":message, "TimeStamp":timeStamp};
  }


  factory Message.fromMap(Map<String, dynamic> json) {
    return Message(
        senderId: json["SenderId"],
        recieverId: json["RecieverId"],
        message: json["Message"],
        timeStamp: json["TimeStamp"]);
  }

}