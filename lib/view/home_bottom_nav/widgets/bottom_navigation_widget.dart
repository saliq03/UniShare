
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/components/bottom_bar_button.dart';
import 'package:unishare/res/routes/routes_name.dart';

import '../../../viewmodels/controller/bottom_nav_controller.dart';


class BottomNavigationWidget extends StatelessWidget {

  final bnController=Get.put(BottomNavController());

  BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey.shade100,
      elevation: 5,
      shape: const CircularNotchedRectangle(),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(()=>BottomBarButton(icon: bnController.pageindex.value==0?
           Icons.home :Icons.home_outlined, name: "Home", onPress: (){
          bnController.changePageIndex(0);
        }),),

         Obx(()=>BottomBarButton(icon: bnController.pageindex.value==1?
             Icons.chat_bubble:Icons.chat_bubble_outline, name: "Chat", onPress: (){
           bnController.changePageIndex(1);
         }), ) ,
          BottomBarButton(icon: Icons.add_box, name: "Donate", onPress: (){
            Get.toNamed(RoutesName.donate_page);
          }),
          Obx(()=>BottomBarButton(icon: bnController.pageindex.value==2?Icons.emergency:
          Icons.emergency_outlined, name: "Emergency", onPress: (){
            bnController.changePageIndex(2);
          }))
        ],
      ),
    );
  }
}
