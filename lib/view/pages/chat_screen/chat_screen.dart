import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/components/customized_back_button.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/pages/chat_screen/widgets/appbar_title_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/message_send_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/photo_send_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/show_messages_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/call_controller.dart';

import '../../../viewmodels/controller/home_controllers/chat_screen_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late UserModel user;

  final csController=Get.put(ChatScreenController());
  final callController=Get.put(CallController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user=Get.arguments;

    csController.manageScrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
      title:AppbarTitleWidget(user: user,),
      titleSpacing: 0,
      leading: const CustomizedBackButton(),
      actions: [
        IconButton(onPressed: (){
         Get.toNamed(RoutesName.callingPage,arguments:{
           "caller": csController.currentUser.value!, // Sender UserModel instance
           "target": user, // Target UserModel instance
         } );
        }, icon: Icon(Icons.call,size: 28,)),
        const SizedBox(width: 10,)
      ],
    ),
      body:Stack(
        children: [
          Column(
            children: [
              Expanded(child:ShowMessagesWidget(receiverEmail:user.Email,)),
              MessageSendWidget(receiverId: user.Email)
            ],
          ),
          PhotoSendWidget()

        ],
      )
    );
  }


}
