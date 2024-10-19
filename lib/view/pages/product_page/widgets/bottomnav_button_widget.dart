import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../res/colors/app_colors.dart';

class BottomnavButtonWidget extends StatelessWidget {
  const BottomnavButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.loginGradient2,
        borderRadius: BorderRadius.circular(7),
      ),

      child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.chat_bubble,size: 35,color: Colors.white,),
            SizedBox(width: 10,),
            Text("Chat",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)

          ]


      ),
    );
  }
}
