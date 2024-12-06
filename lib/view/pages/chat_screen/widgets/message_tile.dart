import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/message_model/message.dart';

class MessageTile extends StatelessWidget {
   MessageTile({required this.currentUser,required this.newMessage,super.key});
  final String currentUser;
  final Message newMessage;
  late  bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
     isCurrentUser =currentUser == newMessage.senderId?true:false;
    return Column(
      crossAxisAlignment: isCurrentUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 7, top: 10,right: 7,bottom: 10),
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  constraints: const BoxConstraints(
                    maxWidth: 300.0,
                    minWidth: 80
                  ),
                  decoration: isCurrentUser? const BoxDecoration(
                      color:  Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),

                      )
                  ): BoxDecoration(
                    color:   Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      newMessage.photo==''?const SizedBox.shrink():
                          CachedNetworkImage(imageUrl: newMessage.photo,
                          placeholder: (context,index)=>const SizedBox(height: 300,
                              child:  Center(child: CircularProgressIndicator())),),
                      newMessage.message==''?const SizedBox.shrink(): Text(
                        newMessage.message,
                        softWrap: true, // Allow the text to wrap
                        maxLines: null, // Allow unlimited lines
                        style: TextStyle(fontSize: 18), // Optional: set text style
                      ),
                    ],
                  ),
                ),
                Text(DateFormat('hh:mm:ss a').format(newMessage.timeStamp.toDate())
                 ,style: TextStyle(fontSize: 13,color: Colors.black45),),
              ],
            )


    ],
    );


  }
}




