import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
   DescriptionWidget({required this.description,super.key});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey.shade300,
      child: TextFormField(

        initialValue: description,
        decoration: InputDecoration(
          border: OutlineInputBorder(

          ),),
        maxLines: 10 ,
        // onSaved: (value) => _description = value ?? '',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a description';
          }
          return null;
        },
      ),
    );
  }
}
