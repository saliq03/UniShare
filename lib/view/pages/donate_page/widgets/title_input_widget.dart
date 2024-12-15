import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/viewmodels/controller/home_controllers/donate_controller.dart';

import '../../../../utils/utils.dart';

class TitleInputWidget extends StatelessWidget {
   TitleInputWidget({super.key});
  final donateController=Get.put(DonateController());

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        TextFormField(
          controller: donateController.titleController.value,
          focusNode: donateController.titleFocusNode.value,
          validator: (value){
            if(value!.isEmpty){
              return "Title can't be empty";
            }
            else if(value.length<6){
              return "Title should be atleast 5 characters";
            }
            return null;
          },
          onFieldSubmitted: (value){
            Utils.fieldFocusChange(context, donateController.titleFocusNode.value,donateController.descriptionFocusNode.value);
          },
        )
      ],
    );
  }
}
