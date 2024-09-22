import 'package:flutter/material.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: "Email",
        prefixIcon: Icon(Icons.person_2_outlined,color: Colors.white,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'Enter Email';
        }
      },
      onFieldSubmitted: (value){

      },
    );
  }
}
