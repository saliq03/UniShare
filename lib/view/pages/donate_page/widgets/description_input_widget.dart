import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionInputWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        TextFormField(),
      ],
    );
  }
}