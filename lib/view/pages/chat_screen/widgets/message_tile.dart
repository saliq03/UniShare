import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/message_model/message.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({required this.currentUser,required this.newMessage,super.key});
  final String currentUser;
  final Message newMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: currentUser == newMessage.senderId
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, top: 10,right: 50,bottom: 25),
              margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
              constraints: BoxConstraints(
                maxWidth: 300.0, // Maximum width for the message container
              ),
              decoration: BoxDecoration(
                color: currentUser == newMessage.senderId ? Colors.green : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                newMessage.message,
                softWrap: true, // Allow the text to wrap
                maxLines: null, // Allow unlimited lines
                style: TextStyle(fontSize: 16), // Optional: set text style
              ),
            ),
            Positioned(
                right: 33,bottom: 7,
                child: Text(DateFormat.jm().format(DateTime.timestamp()),style: TextStyle(fontSize: 13,color: Colors.black45),))
          ],
        ),
      ],
    );


  }
}
