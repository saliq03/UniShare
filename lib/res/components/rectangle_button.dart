import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
class RectangleButton extends StatelessWidget {
  const RectangleButton({super.key,
    required this.title,
    required this.onPress,
    this.height=60,
    this.width=double.infinity,
    this.titleColor= AppColors.black,
    this.buttonColor=AppColors.white,
    this.loading=false});

  final String title;
  final double height,width;
  final Color titleColor, buttonColor;
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          color: buttonColor,
          child: Center(
            child: loading? CircularProgressIndicator():
            Text(title,style:TextStyle(fontWeight: FontWeight.bold,color: titleColor,fontSize: 25)),
          )
      ),
    );
  }
}
