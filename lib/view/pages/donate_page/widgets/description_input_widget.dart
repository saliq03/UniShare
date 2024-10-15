import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../../utils/utils.dart';
import '../../../../viewmodels/controller/home_controllers/donate_controller.dart';

class DescriptionInputWidget extends StatelessWidget {

  final donateController=Get.put(DonateController());
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

        TextFormField(
          controller: donateController.descriptionController.value,
          focusNode: donateController.descriptionFocusNode.value,
          validator: (value){
            if(value!.isEmpty){
              return "Description can't be empty";
            }
            else if(value.length<11){
              return "Description should be atleast 10 characters";
            }
          },
          onFieldSubmitted: (value){
            Utils.fieldFocusChange(context, donateController.descriptionFocusNode.value,donateController.categoryFocusNode.value);
          },
        ),
      ],
    );
  }
}