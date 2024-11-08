import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/view/home_bottom_nav/widgets/bottom_navigation_widget.dart';
import 'package:unishare/view/home_bottom_nav/widgets/drawer_icon.dart';
import 'package:unishare/view/pages/all_chats_page/all_chats_page.dart';
import 'package:unishare/view/pages/home_page/home_page.dart';
import 'package:unishare/view/side_bar/side_bar.dart';
import 'package:unishare/viewmodels/controller/bottom_nav_controller.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List pages=[HomePage(),AllChatsPage()];
  final bnController=Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
     drawer:SideBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("UniShare",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: AppColors.loginGradient3),),
        centerTitle: true,

        leading:Obx(()=>bnController.pageindex.value==0?
        DrawerIcon():const SizedBox.shrink())
      ),
      body:Obx(()=>pages[bnController.pageindex.value]),
      bottomNavigationBar:BottomNavigationWidget()
    );
  }
}
