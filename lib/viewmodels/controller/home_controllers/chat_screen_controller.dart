import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/model/message_model/message.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/chat_services/chat_services.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

class ChatScreenController extends GetxController{
  final chatServices=ChatServices();
 final messageController=TextEditingController().obs;
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    update();
  }


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
}