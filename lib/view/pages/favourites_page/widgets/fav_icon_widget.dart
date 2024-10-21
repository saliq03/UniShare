import 'package:flutter/material.dart';

class FavIconWidget extends StatelessWidget {
  const FavIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Icon(Icons.favorite,size: 35,),
    );
  }
}
