import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/view/pages/chat_screen/widgets/appbar_title_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/message_send_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/show_messages_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late UserModel user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user=Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      title:AppbarTitleWidget(photo: user.Photo,name: user.Name,)
    ),
      body: Column(
        children: [
          Expanded(child:ShowMessagesWidget()),
          MessageSendWidget(receiverId: user.Email)
        ],
      )
    );
  }
}
