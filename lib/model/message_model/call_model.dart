import 'package:cloud_firestore/cloud_firestore.dart';

class CallModel {
 final String id;
 final String callerName;
 final String callerPic;
 final String callerEmail;
 final String receiverName;
 final String receiverPic;
 final String receiverEmail;
 final String status;
  final Timestamp timeStamp;

  CallModel(
      {required this.id,
        required this.callerName,
        required this.callerPic,
        required this.callerEmail,
        required this.receiverName,
        required this.receiverPic,
        required this.receiverEmail,
        required this.status,
        required this.timeStamp,});

  toJson() {
   return {
     'Id':id,
    'CallerName':callerName,
    'CallerPic': callerPic ,
     'CallerEmail': callerEmail,
    'ReceiverName': receiverName ,
    'ReceiverPic': receiverPic,
    'ReceiverEmail': receiverEmail,
    'Status': status,
     'TimeStamp':timeStamp
    };
  }

 factory CallModel.fromJson(Map<String, dynamic> json) {
    return CallModel(id : json['Id'],
        callerName : json['CallerName'],
        callerPic :json['CallerPic'],
        callerEmail : json['CallerEmail'],
        receiverName : json['ReceiverName'],
        receiverPic : json['ReceiverPic'],
        receiverEmail : json['ReceiverEmail'],
        status : json['Status'],
        timeStamp: json['TimeStamp']);
  }


}
