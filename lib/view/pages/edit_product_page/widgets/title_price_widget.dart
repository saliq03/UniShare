import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/utils/utils.dart';

import '../../../../viewmodels/controller/home_controllers/edit_product_controller.dart';

class TitlePriceWidget extends StatelessWidget {
   TitlePriceWidget({super.key});

  final editProductController=Get.put(EditProductController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: editProductController.titleController.value,
          focusNode: editProductController.titleFocusNode.value,
          decoration: InputDecoration(labelText: 'Title',
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)),
          // onSaved: (value) => _title = value ?? '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a title';
            }
            else if(value.length<6){
              return 'Title too short';
            }
            return null;
          },
          onFieldSubmitted: (value){
            Utils.fieldFocusChange(context, editProductController.titleFocusNode.value,
                editProductController.priceFocusNode.value);
          },
        ),
        SizedBox(height: 16),
        Text("Price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
        TextFormField(
          controller: editProductController.priceController.value,
          focusNode: editProductController.priceFocusNode.value,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.currency_rupee,size: 20,),

          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a price';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
          onFieldSubmitted: (value){
            Utils.fieldFocusChange(context, editProductController.priceFocusNode.value,
                editProductController.descriptionFocusNode.value);
          },
        ),
      ],
    );
  }
}
