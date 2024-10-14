import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarButton extends StatelessWidget {

  final IconData icon;
  final String name;
  final VoidCallback onPress;
  const BottomBarButton({super.key, required this.icon, required this.name, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Icon(icon),
          Text(name)
        ],
      ),
    );
  }
}
