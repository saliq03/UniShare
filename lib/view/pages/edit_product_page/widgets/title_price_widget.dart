import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../viewmodels/controller/home_controllers/edit_product_controller.dart';

class TitlePriceWidget extends StatelessWidget {
   TitlePriceWidget({super.key});

  final editProductController=Get.put(EditProductController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: editProductController.titleController.value,

          decoration: InputDecoration(labelText: 'Title',
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)),
          // onSaved: (value) => _title = value ?? '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a title';
            }
            return null;
          },
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: editProductController.priceController.value,

          decoration: InputDecoration(labelText: 'Price (for free set price as 0)',
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)
          ),
          keyboardType: TextInputType.number,
          // onSaved: (value) => _price = value ?? '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a price';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
      ],
    );
  }
}
