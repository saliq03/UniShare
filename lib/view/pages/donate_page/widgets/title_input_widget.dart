import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
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
          },
          onFieldSubmitted: (value){
            Utils.fieldFocusChange(context, donateController.titleFocusNode.value,donateController.descriptionFocusNode.value);
          },
        )
      ],
    );
  }
}
