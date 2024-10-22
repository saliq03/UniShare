import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../viewmodels/controller/home_controllers/edit_product_controller.dart';

class DescriptionWidget extends StatelessWidget {
   DescriptionWidget({super.key});

   final editProductController=Get.put(EditProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey.shade300,
      child: TextFormField(
          controller: editProductController.descriptionController.value,

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
