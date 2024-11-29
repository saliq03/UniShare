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
child:  Container(
    height: 50,width: 50,
  margin:  EdgeInsets.only(left: 10,bottom: 5),
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.black,
          width: 2
        )
      ),


     child: ClipRRect(
       borderRadius: BorderRadius.circular(25),
    child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: 50,width: 50,
        imageUrl: bnController.photo.value,
        placeholder: (context,url)=> Image.asset(IconsAssets.person,height: 35,),
        ),
  )));
});

  }
}
