

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unishare/res/colors/app_colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key,
    required this.title,
    required this.onPress,
    this.titleColor=AppColors.white});
 final String title;
 final VoidCallback onPress;
 final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Text(title,style: TextStyle(color: titleColor),),
    );
  }
}
