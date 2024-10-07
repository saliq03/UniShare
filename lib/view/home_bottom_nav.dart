import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:unishare/view/side_bar.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: SideBar(),
      appBar: AppBar(),
      body:Padding(padding:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Container(
          color: Colors.red,
        ),
      ),
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
      ),
    );
  }
}
