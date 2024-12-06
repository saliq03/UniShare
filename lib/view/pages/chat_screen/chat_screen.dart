import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/components/customized_back_button.dart';
import 'package:unishare/view/pages/chat_screen/widgets/appbar_title_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/message_send_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/photo_send_widget.dart';
import 'package:unishare/view/pages/chat_screen/widgets/show_messages_widget.dart';

import '../../../viewmodels/controller/home_controllers/chat_screen_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late UserModel user,currUser;

  final csController=Get.put(ChatScreenController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user=Get.arguments;
    getCurrUser();
    csController.manageScrollDown();
  }
  getCurrUser() async {
    currUser=await csController.getCurrentUser();
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
        IconButton(onPressed: (){}, icon: Icon(Icons.call,size: 28,)),
        SizedBox(width: 10,)
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
