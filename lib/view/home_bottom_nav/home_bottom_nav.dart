import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:unishare/res/colors/app_colors.dart';
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

        leading: Builder(builder: (context){
          return InkWell(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          );
        })
      ),
      body:HomePage(),
      bottomNavigationBar:CurvedNavigationBar(
          items: [
            Icon(Icons.home_outlined,color: Colors.white,),
            Icon(Icons.search_outlined,color: Colors.white,),
            Icon(Icons.category_outlined,color: Colors.white,),
          ],
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        color: Colors.black54,
        height: 65,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index){

        },
      ),
    );
  }
}
