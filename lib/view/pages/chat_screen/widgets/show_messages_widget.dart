import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/view/pages/chat_screen/widgets/message_tile.dart';

import '../../../../viewmodels/controller/home_controllers/chat_screen_controller.dart';

class ShowMessagesWidget extends StatelessWidget {
   ShowMessagesWidget({required this.receiverEmail,super.key});
   final String receiverEmail;
  final csController=Get.put(ChatScreenController());
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.blue.shade300,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Obx(()=>
      csController.currentUser.value!=null?
      StreamBuilder(
          stream: csController.recieveMessages(receiverEmail),
          builder: (context,snapshot){
      if(snapshot.hasError){
      return Center(
      child: Column(
      children: [
      Icon(Icons.error_outline_rounded,size: 50,color: Colors.red,),
      Text("Something went wrong",style: TextStyle(fontSize: 20),)
      ],
      ),
      );
      }
      else if(snapshot.connectionState==ConnectionState.waiting){
      return Center(child: CircularProgressIndicator());
      }
      else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
         csController.manageScrollDown();
        });

        // final sortedMessages = List.from(snapshot.data!)
        //   ..sort((a, b) => a.timeStamp.compareTo(b.timeStamp));

        return ListView.builder(
          controller: csController.scrollController.value,

            itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
              return MessageTile(currentUser: csController.currentUser.value!.email, newMessage: snapshot.data![index]);
            });
      }
      }):
          Center(child: CircularProgressIndicator()))
    );
  }
}
