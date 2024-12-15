import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key,required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
    radius: 70,
    backgroundColor: Colors.white,
    child: Center(child: Text(name[0].toUpperCase(),style: const TextStyle(fontSize: 28,fontWeight: FontWeight.w500,fontFamily: "FiraSans"),)),
    );
  }
}
