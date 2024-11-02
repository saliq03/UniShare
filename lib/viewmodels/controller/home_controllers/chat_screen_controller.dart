import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/services/chat_services/chat_services.dart';

class ChatScreenController extends GetxController{
  final chatServices=ChatServices();
 final messageController=TextEditingController().obs;


  sendMessage(String receiverId)async{
    print(" controller method ");
    if(messageController.value.text!=''){
      try{
         await chatServices.sendMessage(receiverId, messageController.value.text);
      } catch(e){
        print(e.toString());
      }
      messageController.value.clear();
    }


  }
}