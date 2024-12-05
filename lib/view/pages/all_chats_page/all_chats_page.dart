
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          // color: Color(0xFFF5F5F5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Center( child: Padding( padding: const EdgeInsets.symmetric(vertical: 5),
               child: Text("Messages",style: Theme.of(context).textTheme.headlineMedium,))),

              Expanded(child: ChatsStreambuilderWidget()),
        ],
      ),
    );
  }
}
