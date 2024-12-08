class CallModel {
  String id;
  String callerName;
  String callerPic;
  String callerEmail;
  String receiverName;
  String receiverPic;
  String receiverEmail;
  String status;

  CallModel(
      {required this.id,
        required this.callerName,
        required this.callerPic,
        required this.callerEmail,
        required this.receiverName,
        required this.receiverPic,
        required this.receiverEmail,
        required this.status});

  toJson() {
   return {
     'Id':id,
    'CallerName':callerName,
    'CallerPic': callerPic ,
     'CallerEmail': callerEmail,
    'ReceiverName': receiverName ,
    'ReceiverPic': receiverPic,
    'ReceiverEmail': receiverEmail,
    'Status': status
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
        status : json['Status']);
  }


}
