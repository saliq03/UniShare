import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
   const CategoryButton({ super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        height: 30,
        width: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF3C3C3C),
        ),
        child: Center(
          child: Text(title,style: TextStyle(color: Color(0xFFE2E2E2),fontSize: 18),),
        ),
      ),
    );
  }
}
