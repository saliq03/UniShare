import 'package:flutter/material.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/view/home_bottom_nav/widgets/bottom_navigation_widget.dart';
import 'package:unishare/view/home_bottom_nav/widgets/drawer_icon.dart';
import 'package:unishare/view/pages/home_page/home_page.dart';
import 'package:unishare/view/side_bar/side_bar.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
     drawer: SideBar(),

      appBar: AppBar(
        title: Text("UniShare",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: AppColors.loginGradient3),),
        centerTitle: true,

        leading: DrawerIcon()
      ),
      body:HomePage(),
      bottomNavigationBar:BottomNavigationWidget()
    );
  }
}
