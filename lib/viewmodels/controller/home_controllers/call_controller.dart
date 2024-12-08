import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unishare/model/message_model/call_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/chat_services/call_Services.dart';
import 'package:unishare/viewmodels/services/generate_ids_service.dart';

class CallController extends GetxController{
 final FirebaseAuth _auth=FirebaseAuth.instance;
 final CallServices callServices=CallServices();

  callAction(UserModel reciever,UserModel caller){
    String id=GenerateIds().GenerateCallId(caller.Email, reciever.Email);
   CallModel newCall=CallModel(
       id: id,
       callerName: caller.Name,
       callerPic: caller.Photo,
       callerEmail: caller.Email,
       receiverName: reciever.Name,
       receiverPic: reciever.Photo,
       receiverEmail: reciever.Email,
       status: "calling");
   callServices.sendCallNotification(newCall);
  }
}