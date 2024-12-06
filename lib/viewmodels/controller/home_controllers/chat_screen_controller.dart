import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/model/message_model/message.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/chat_services/chat_services.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

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

    print(" controller method ");
    if(selectedImage.value==null){
    if(messageController.value.text!=''){
      try{
         await chatServices.sendMessage(receiverId, messageController.value.text,'','');
      } catch(e){
        print(e.toString());
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
           });
        });
        } catch(e){
        print(e.toString());
      }

    }

    }



  Stream<List<Message>> recieveMessages(String receiverId) async* {
    UserModel currUser=await UserPrefrences().GetUser();
    yield* chatServices.getMessage(currUser.Email, receiverId).asyncMap((snapshot) async {
      final messages = snapshot.docs.map((doc) {
        return Message.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return messages;
    });
  }

 getCurrentUser() async {
    currentUser.value=await UserPrefrences().GetUser();
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
}