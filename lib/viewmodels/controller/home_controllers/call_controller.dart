
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/model/message_model/call_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/constants/constants.dart';
import 'package:unishare/services/chat_services/call_Services.dart';
import 'package:unishare/view/pages/audiocall_screen/audiocall_screen.dart';
import 'package:unishare/viewmodels/services/generate_ids_service.dart';

class CallController extends GetxController{
 final CallServices callServices=CallServices();
 late CallModel currCall;


 @override
 void onInit(){
  super.onInit();
  callServices.getCallNotification().listen((data){

   if(data.isNotEmpty){
    CallModel call=data[0];
    UserModel target=UserModel(
        Photo: call.callerPic,
        Bio: '', Name: call.callerName,
        Email: call.callerEmail, Gender: '', Status: '');
    Get.snackbar(call.callerName,
        "Incoming call",
        duration:  const Duration(seconds: 30),
    backgroundColor: Colors.grey,
    animationDuration: Duration(microseconds: 1),
    onTap: (value){
     callServices.updateCallStatus(CallStatus.completed, call);
     Get.to(AudiocallScreen(target: target));
     Get.closeCurrentSnackbar();
    },
    mainButton: TextButton(onPressed: (){
     callServices.updateCallStatus(CallStatus.rejected, call);
     Get.closeCurrentSnackbar();
     callServices.endCall(call);
    }, child: const Text("End call",style: TextStyle(color: Colors.red),)));
   }
  });
 }

  callAction(UserModel reciever,UserModel caller){
    String id=GenerateIds().GenerateCallId(caller.Email, reciever.Email);
    final Timestamp timestamp=Timestamp.now();
   CallModel newCall=CallModel(
       id: id,
       callerName: caller.Name,
       callerPic: caller.Photo,
       callerEmail: caller.Email,
       receiverName: reciever.Name,
       receiverPic: reciever.Photo,
       receiverEmail: reciever.Email,
       status: reciever.Status=="Online"? CallStatus.ringing:CallStatus.calling,
      timeStamp: timestamp);
   currCall=newCall;
   callServices.sendCallNotification(newCall);

   call(reciever, newCall);
   callServices.saveCalls(newCall);

  }


 call(UserModel target,CallModel call){
  callServices.getCall().listen((data){
   call=data[0];
   if(call.status==CallStatus.completed){
    Get.off(AudiocallScreen(target: target));
   }
  });
  Future.delayed(const Duration(seconds: 30),(){
   if(call.status!=CallStatus.completed) {
    endCall();
   }
  });

 }

 endCall(){
  callServices.endCall(currCall);
  Get.back();
 }



}