import 'package:flutter/cupertino.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../../model/message_model/message.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({required this.currentUser,required this.newMessage,super.key});
  final String currentUser;
  final Message newMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: currentUser==newMessage.senderId?
        CrossAxisAlignment.end:
        CrossAxisAlignment.start,
        children: [
          Text(newMessage.message),
        ],
      ),
    );
  }
}
