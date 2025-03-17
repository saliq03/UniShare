import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/model/message_model/message.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/chat_services/chat_services.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../services/notification_services/notification_service.dart';
import '../../../services/notification_services/send_notification.dart';

class ChatScreenController extends GetxController{


  final chatServices=ChatServices();
 final messageController=TextEditingController().obs;
 final messageFocusNode=FocusNode().obs;
 final scrollController=ScrollController().obs;
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  var isTextFieldEmpty = true.obs;
  final loading=false.obs;



  Rx<File?> selectedImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();

    getCurrentUser();
    update();
  }

  manageScrollDown(){
    messageFocusNode.value.addListener((){
      if(messageFocusNode.value.hasFocus){
        Future.delayed(const Duration(milliseconds: 300),
            ()=>scrollDown());
      }
    });

    Future.delayed(const Duration(milliseconds: 500),
            ()=>scrollDown());
  }
  scrollDown(){
    scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  sendMessage(String receiverId)async{
    UserModel currUser=await UserPrefrences().getUser();
    String token=await NotificationServices().fetchFCMToken(receiverId);

    if(selectedImage.value==null){
    if(messageController.value.text!=''){
      try{
         await chatServices.sendMessage(receiverId, messageController.value.text,'','');

         SendNotifications.sendNotificationToSpecificUser(
             token: token, title:currUser.name, body: "Sent a Chat",
             data: {
                   "type": "message",
                   "Sender":currUser.email
                 });
      } catch(e){
        if (kDebugMode) {
          print(e.toString());
        }
      }
      messageController.value.clear();
      manageScrollDown();
    }
  }
    else{
      try{
         loading.value=true;
        final img = XFile(selectedImage.value!.path);
        chatServices.uploadImage(img).then((value){
           chatServices.sendMessage(receiverId, messageController.value.text,value,'').then((value){
             loading.value=false;
             selectedImage.value=null;
             messageController.value.clear();
             manageScrollDown();
             SendNotifications.sendNotificationToSpecificUser(
                 token: token, title:currUser.name, body: "Sent a Photo",
                 data: {
                   "type": "message",
                   "Sender":currUser.email
             });
           });
        });
        } catch(e){
        if (kDebugMode) {
          print(e.toString());
        }
      }

    }

    }



  Stream<List<Message>> recieveMessages(String receiverId) async* {
    UserModel currUser=await UserPrefrences().getUser();
    yield* chatServices.getMessage(currUser.email, receiverId).asyncMap((snapshot) async {
      final messages = snapshot.docs.map((doc) {
        return Message.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return messages;
    });
  }

 getCurrentUser() async {
    currentUser.value=await UserPrefrences().getUser();
  }

  onMessageTextChanged(String value){
    isTextFieldEmpty.value = value==''?true:false;
    update();
  }

  pickImage(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source,imageQuality: 70);
      if (img == null) return;
      final tempImg = File(img.path);
      selectedImage.value=tempImg;
      update();
    }
    catch(ex){
      if (kDebugMode) {
        print(ex.toString());
      }
    }
  }

  Stream<UserModel> getStatus(String email){
    return chatServices.fetchUser(email);
  }
}