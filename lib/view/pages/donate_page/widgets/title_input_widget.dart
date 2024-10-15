import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleInputWidget extends StatelessWidget {
  const TitleInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        TextFormField()
      ],
    );
  }
}
