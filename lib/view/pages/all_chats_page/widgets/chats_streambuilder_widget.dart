import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewmodels/controller/home_controllers/all_chats_page_controller.dart';
import 'chat_tile.dart';

class ChatsStreambuilderWidget extends StatelessWidget {
   ChatsStreambuilderWidget({super.key});
  final allchatsController=Get.put(AllChatsPageController());
  // final String currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: allchatsController.getChats(),
         builder: (context,snapshot){
          if(snapshot.hasError){
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline_rounded,size: 50,color: Colors.red,),
                    Text("Something went wrong",style: TextStyle(fontSize: 20),),
                    Text(snapshot.error.toString())
                  ],
                ),
              ),
            );
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else{
            if(snapshot.data!.isNotEmpty){
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        ChatTile(user: snapshot.data![index]["User"],chat: snapshot.data![index]["Chat"],),
                        const SizedBox(height: 10,)
                      ],
                    );
                  });
            }
            else {
              return SizedBox(
                height: double.infinity,
                  child: Center(child: Text("No chats yet",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)));
            }

          }
         });
  }
}
