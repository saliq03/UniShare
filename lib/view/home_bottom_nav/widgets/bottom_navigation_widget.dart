import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
    items: [
    Icon(Icons.home_outlined,color: Colors.white,),
    Icon(Icons.add ,size: 40,color: Colors.white,),
    Icon(Icons.category_outlined,color: Colors.white,),
    ],
    buttonBackgroundColor: Colors.black,
    backgroundColor: Colors.white,
    color: Colors.black54,
    height: 65,
    animationDuration: Duration(milliseconds: 500),
    onTap: (index){

    },
  );
  }
}
