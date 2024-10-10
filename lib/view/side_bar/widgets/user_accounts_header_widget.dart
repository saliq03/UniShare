import 'package:flutter/material.dart';

import '../../../res/assets/icons_assets.dart';

class UserAccountsHeaderWidget extends StatelessWidget {
  const UserAccountsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
        accountName: Text("Saliq javeed"),
        accountEmail: Text("javidsaliq@gmail.com"),
        currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset(IconsAssets.tickedCircle
                ,width: 90,height: 90,
                fit: BoxFit.cover,),)),
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              image: NetworkImage("https://img.freepik.com/free-photo/abstract-dark-blurred-background-smooth-gradient-texture-color-shiny-bright-website-pattern-banner-header-sidebar-graphic-art-image_1258-85447.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1727740800&semt=ais_hybrid"),
              fit: BoxFit.cover
          ),
        ));
  }
}
