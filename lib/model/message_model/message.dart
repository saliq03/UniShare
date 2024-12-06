import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
   final String id;
  final String senderId;
  final String recieverId;
  final String message;
  final String photo;
  final String video;
  final Timestamp timeStamp;

  Message( {
    required this.id,
    required  this.senderId,
    required this.recieverId,
    required this.message,
    required this.photo,
    required this.video,
    required this.timeStamp,
   });

  toJson(){
    return {"Id":id,
      "SenderId":senderId,
      "RecieverId":recieverId,
      "Message":message,
      "Photo":photo,
      "Video":video,
      "TimeStamp":timeStamp};
  }


  factory Message.fromMap(Map<String, dynamic> json) {
    return Message(
        id: json["Id"],
        senderId: json["SenderId"],
        recieverId: json["RecieverId"],
        message: json["Message"],
        photo: json["Photo"],
        video: json["Video"],
        timeStamp: json["TimeStamp"],
       );
  }

}