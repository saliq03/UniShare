import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: "Password",
        prefixIcon: Icon(Icons.lock,color: Colors.white,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
            )
        ),
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'Enter Password';
        }
      },
      onFieldSubmitted: (value){

      },
    );
  }
}
