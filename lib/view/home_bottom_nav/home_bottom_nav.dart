import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),

          key: _scaffoldKey,
       drawer:SideBar(),

        body:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(()=>bnController.pageindex.value==0?
                DrawerIcon():const SizedBox(height: 55,width: 60,)),
                const Text("UniShare",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: AppColors.loginGradient3),),
                const SizedBox(width: 10,)
              ],
            ),
            Expanded(child: Obx(()=>pages[bnController.pageindex.value])),
          ],
        ),
        bottomNavigationBar:BottomNavigationWidget()
      ),
    );
  }
}
