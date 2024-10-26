import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/viewmodels/controller/home_controllers/sidebar_controller.dart';

import '../../../res/assets/icons_assets.dart';

class UserAccountsHeaderWidget extends StatelessWidget {
   UserAccountsHeaderWidget({super.key});
final sidebarController=Get.put(SidebarController());


  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(

        accountName: Obx(()=>Text(sidebarController.Name.value)),


        accountEmail:Obx(()=>Text(sidebarController.Email.value)) ,
        currentAccountPicture:  CircleAvatar(
              child: ClipOval(
                child: CachedNetworkImage(imageUrl:sidebarController.Photo.value,
                placeholder: (context,url)=>Center(child: CircularProgressIndicator()),))),
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              image: NetworkImage("https://img.freepik.com/free-photo/abstract-dark-blurred-background-smooth-gradient-texture-color-shiny-bright-website-pattern-banner-header-sidebar-graphic-art-image_1258-85447.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1727740800&semt=ais_hybrid"),
              fit: BoxFit.cover
          ),
        ));
  }
}
