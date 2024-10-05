import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/constants/constants.dart';

import '../../../../utils/utils.dart';
import '../../../../viewmodels/controller/signup_controller.dart';


class GenderSelectionWidget extends StatelessWidget {
  GenderSelectionWidget({super.key});
  String? _selectedGender;

  final signupController=Get.put(SignupController());
  final List<String> _genders = [Constants.male, Constants.female,Constants.other];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        focusNode: signupController.genderFocusNode.value,
        decoration: InputDecoration(
          labelText: "Select gender",
          labelStyle: TextStyle(color: Colors.white,fontSize: 17,fontStyle: FontStyle.italic),
           enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(30),
             borderSide: BorderSide(
                 color: Colors.white)
           ),


        ),

        value: signupController.gender.value,
        items: _genders.map((gender) {

          return DropdownMenuItem<String>(

            value: gender,

            child: Text(gender,style: TextStyle(color: Colors.white),),
          );
        }).toList(),
        onChanged: (value) {
        signupController.gender.value=value!;
        Utils.fieldFocusChange(context,
            signupController.genderFocusNode.value,
            signupController.passwordFocusNode.value);
        },
        hint: Text('Select gender',style: TextStyle(color: Colors.white,fontSize: 16),),
        dropdownColor: Colors.black26,
        iconEnabledColor: Colors.white,



    );
  }
}