import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCategoryWidget extends StatelessWidget {
   SelectCategoryWidget({super.key});
  final List<String> _categories = ["Books", "Utensils","other"];
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration(
        labelText: "Select Category",
        labelStyle: TextStyle(color: Colors.black,fontSize: 17,fontStyle: FontStyle.italic),
        enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: Colors.black)
        ),


      ),

      value: _selectedCategory,
      items: _categories.map((gender) {

        return DropdownMenuItem<String>(

          value: gender,

          child: Text(gender,style: TextStyle(color: Colors.black),),
        );
      }).toList(),
      onChanged: (value) {
        _selectedCategory=value;
      },
      hint: Text('Select category',style: TextStyle(color: Colors.black,fontSize: 16),),
      dropdownColor: Colors.grey.shade500,
      iconEnabledColor: Colors.black54,



    );
  }
}
