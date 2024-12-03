import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unishare/model/message_model/chat_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/routes/routes_name.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({required this.user,required this.chat,super.key});
  final UserModel user;
  final ChatModel chat;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Get.toNamed(RoutesName.chatScreen,arguments: user);
      },
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Container(

            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),

              borderRadius: BorderRadius.circular(15)
            ),
            child:Row(
              children: [
                Container(
                  width:70,height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: CachedNetworkImage(imageUrl: user.Photo,
                      placeholder: (context,url)=>Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
                  ),

                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.Name,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontFamily: "FiraSans",color: Color(0xFF3C3C3C),overflow: TextOverflow.ellipsis),),
                      Text("${user.Email==chat.lastSenderId? user.Name:'You'}: ${chat.lastMessage}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "FiraSans",color: Color(0xFF8A8A8A)),
                        overflow: TextOverflow.ellipsis,
                      ),
                        ],
                      ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10,),
                    chat.unreadMessages=='0'?SizedBox(height: 20,):
                    Card(
                      margin: EdgeInsets.only(right: 10),
                      elevation: 5,
                      child: Container(
                        height: 20,width:20,
                        decoration:BoxDecoration(
                            color: AppColors.loginGradient3,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text(chat.unreadMessages,style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(formatTimestamp(chat.lastTimeStamp),style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "FiraSans",color: Color(0xFF828282)),
                    ),
                  ],
                )

                  ],
                ),
            ),
      )

        
    );
  }

  String formatTimestamp(Timestamp timestamp) {
    final DateTime messageDate = timestamp.toDate();
    final DateTime now = DateTime.now();
    final DateTime yesterday = now.subtract(Duration(days: 1));

    if (DateFormat('yyyy-MM-dd').format(messageDate) ==
        DateFormat('yyyy-MM-dd').format(now)) {
      // Today
      return DateFormat('hh:mm a').format(messageDate);
    } else if (DateFormat('yyyy-MM-dd').format(messageDate) ==
        DateFormat('yyyy-MM-dd').format(yesterday)) {
      // Yesterday
      return 'Yesterday';
    } else {
      // Earlier dates
      return DateFormat('dd-MM-yyyy').format(messageDate);
    }
  }
}
