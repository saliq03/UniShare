import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/view/pages/all_chats_page/widgets/chat_tile.dart';
import 'package:unishare/view/pages/all_chats_page/widgets/chats_streambuilder_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/all_chats_page_controller.dart';

class AllChatsPage extends StatefulWidget {
  const AllChatsPage({super.key});

  @override
  State<AllChatsPage> createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {

   final allchatsController=Get.put(AllChatsPageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Chats",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: AppColors.loginGradient1),),
          Expanded(child: ChatsStreambuilderWidget())
        ],
      ),
    );
  }
}