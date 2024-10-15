
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unishare/res/components/bottom_bar_button.dart';
import 'package:unishare/view/pages/donate_page/donate_page.dart';

class BottomNavigationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomBarButton(icon: Icons.home_outlined, name: "Home", onPress: (){}),
          BottomBarButton(icon: Icons.chat_bubble_outline, name: "Chat", onPress: (){}),
          BottomBarButton(icon: Icons.add_box, name: "Donate", onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>DonatePage()));
          }),
          BottomBarButton(icon: Icons.emergency_outlined, name: "Emergency", onPress: (){})
        ],
      ),
    );
  }
}
