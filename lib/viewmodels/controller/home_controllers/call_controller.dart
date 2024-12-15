
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/model/message_model/call_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/constants/constants.dart';
import 'package:unishare/services/chat_services/call_services.dart';
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
        photo: call.callerPic,
        bio: '', name: call.callerName,
        email: call.callerEmail, gender: '', status: '');

    if(call.status==CallStatus.ringing){
     Get.snackbar(call.callerName,
         "Incoming call",
         duration:  const Duration(seconds: 30),
         backgroundColor: Colors.grey,
         animationDuration: const Duration(microseconds: 1),
         onTap: (value){
          callServices.updateCallStatus(CallStatus.completed, call);
          Get.to(()=> AudiocallScreen(target: target,call: call,));
          Get.closeCurrentSnackbar();
         },
         mainButton: TextButton(onPressed: (){
          callServices.updateCallStatus(CallStatus.rejected, call);
          Get.closeCurrentSnackbar();
         }, child: const Text("End call",style: TextStyle(color: Colors.red),)));
    }
    else if(call.status==CallStatus.missed){
     Get.closeCurrentSnackbar();
    }

   }
  });
 }

  callAction(UserModel reciever,UserModel caller){
    String id=GenerateIds().generateCallId(caller.email, reciever.email);
    final Timestamp timestamp=Timestamp.now();
   CallModel newCall=CallModel(
       id: id,
       callerName: caller.name,
       callerPic: caller.photo,
       callerEmail: caller.email,
       receiverName: reciever.name,
       receiverPic: reciever.photo,
       receiverEmail: reciever.email,
       status: reciever.status=="Online"? CallStatus.ringing:CallStatus.calling,
      timeStamp: timestamp);
   currCall=newCall;
   callServices.sendCallNotification(newCall);

   call(reciever, newCall);
   callServices.saveCalls(newCall);

  }


 call(UserModel target, CallModel call) {
  callServices.getCall(target).listen((data) {
   if (data.isNotEmpty) {
    call = data[0];

    if (call.status == CallStatus.completed) {
     // Navigate to AudiocallScreen
     Get.off(() => AudiocallScreen(target: target,call: call,));
    }
    else if(call.status==CallStatus.rejected){

     endCall();
    }
   }
  });

  Future.delayed(const Duration(seconds: 30), () {

   if (call.status ==CallStatus.ringing||call.status== CallStatus.calling) {
    endCall();
   }
  });
 }


 endCall(){
  callServices.endCall(currCall);
  Get.back();
 }

 cancelCall(){
  callServices.updateCallStatus(CallStatus.missed, currCall);
  endCall();
 }
 cancelCallByNavigatingBack(){
  callServices.updateCallStatus(CallStatus.missed, currCall);
  callServices.endCall(currCall);
 }



}