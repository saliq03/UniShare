import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/view/pages/all_chats_page/widgets/chat_tile.dart';

class AllChatsPage extends StatefulWidget {
  const AllChatsPage({super.key});

  @override
  State<AllChatsPage> createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Chats",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: AppColors.loginGradient1),),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
              return ChatTile(index: index);
            }),
          )
        ],
      ),
    );
  }
}
