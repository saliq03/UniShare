import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../utils/utils.dart';
import '../../../../viewmodels/controller/home_controllers/donate_controller.dart';

class DescriptionInputWidget extends StatelessWidget {
  DescriptionInputWidget({super.key});
  final donateController=Get.put(DonateController());


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style:Theme.of(context).textTheme.titleLarge,
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
            return null;
          },
          onFieldSubmitted: (value){
            Utils.fieldFocusChange(context, donateController.descriptionFocusNode.value,donateController.categoryFocusNode.value);
          },
        ),
      ],
    );
  }
}