import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/assets/icons_assets.dart';

class DrawerIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
return InkWell(
onTap: (){
Scaffold.of(context).openDrawer();
},
child: CircleAvatar(
backgroundColor: Colors.white,
child: Image.asset(IconsAssets.person,height: 35,),
),
);
});
  }
}
