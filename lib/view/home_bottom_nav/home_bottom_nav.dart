import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/view/home_bottom_nav/widgets/bottom_navigation_widget.dart';
import 'package:unishare/view/pages/all_chats_page/all_chats_page.dart';
import 'package:unishare/view/pages/emergency_request_page/emeregency_request_page.dart';
import 'package:unishare/view/pages/home_page/home_page.dart';
import 'package:unishare/view/side_bar/side_bar.dart';
import 'package:unishare/viewmodels/controller/bottom_nav_controller.dart';
import 'package:unishare/viewmodels/controller/home_controllers/call_controller.dart';
import 'package:unishare/viewmodels/controller/profile_controller.dart';
import 'package:unishare/viewmodels/controller/status_controller.dart';

import '../../services/notification_services/notification_service.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  StatusController statusController=Get.put(StatusController());
  ProfileController profileController=Get.put(ProfileController());
  CallController callController=Get.put(CallController());
  NotificationServices notificationServices=NotificationServices();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List pages=[const HomePage(),const AllChatsPage(),const EmeregencyRequestPage()];
  final bnController=Get.put(BottomNavController());

  @override
  void initState() {
    super.initState();
    notificationServices.firebaseInit(context);
    notificationServices.setUpInteractMessage(context);
     notificationServices.getDeviceToken().then((token){
       print("token: ");
       print(token);
     });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),

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
