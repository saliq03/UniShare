import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/viewmodels/controller/bottom_nav_controller.dart';

import '../../../res/assets/icons_assets.dart';

class DrawerIcon extends StatelessWidget {
 final bnController=Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
return InkWell(
onTap: (){
Scaffold.of(context).openDrawer();
},
child:  CircleAvatar(
  backgroundColor: Colors.white,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: 40,width: 40,
        imageUrl: bnController.photo.value,
        placeholder: (context,url)=> Image.asset(IconsAssets.person,height: 35,),
        ),
  )));
});

  }
}
