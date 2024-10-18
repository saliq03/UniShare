import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../viewmodels/controller/home_controllers/donate_controller.dart';

class SelectCategoryWidget extends StatelessWidget {
   SelectCategoryWidget({super.key});
  final List<String> _categories = ["Books", "Utensils","other"];

   final donateController=Get.put(DonateController());

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
       focusNode: donateController.categoryFocusNode.value,
      decoration: InputDecoration(
        labelText: "Select Category",
        labelStyle: TextStyle(color: Colors.black,fontSize: 17,fontStyle: FontStyle.italic),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black)
        )),
      validator: (value){
         if(donateController.selectedCategory==null){
           return "Category can't be null";
         }
      },

      value: donateController.selectedCategory!.value.isEmpty ? null : donateController.selectedCategory!.value,
      items: _categories.map((gender) {

        return DropdownMenuItem<String>(

          value: gender,

          child: Text(gender,style: TextStyle(color: Colors.black),),
        );
      }).toList(),
      onChanged: (value) {
        donateController.selectedCategory!.value = value ?? '';
      },
      hint: Text('Select category',style: TextStyle(color: Colors.black,fontSize: 16),),
      dropdownColor: Colors.grey.shade500,
      iconEnabledColor: Colors.black54,



    );
  }
}
