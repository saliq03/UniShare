import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/view/home_bottom_nav/widgets/bottom_navigation_widget.dart';
import 'package:unishare/view/pages/all_chats_page/all_chats_page.dart';
import 'package:unishare/view/pages/home_page/home_page.dart';
import 'package:unishare/view/side_bar/side_bar.dart';
import 'package:unishare/viewmodels/controller/bottom_nav_controller.dart';
import 'package:unishare/viewmodels/controller/home_controllers/call_controller.dart';
import 'package:unishare/viewmodels/controller/status_controller.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  StatusController statusController=Get.put(StatusController());
  CallController callController=Get.put(CallController());

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

            Expanded(child: Obx(()=>pages[bnController.pageindex.value])),
          ],
        ),
        bottomNavigationBar:BottomNavigationWidget()
      ),
    );
  }
}
