import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(IconsAssets.lock,width: 100,),
            SizedBox(height: 20,width: double.infinity,),
            Text("Forget\nPassword",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, height: 1.0),),
             SizedBox(height: 10,),
            Text("Please Enter your registered email to reset your password!",textAlign: TextAlign.center,style: TextStyle(fontSize: 19),),
             SizedBox(height: 30,),

            Container(
              color: Colors.grey.shade50,
              child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email_outlined,size: 30,),
              enabledBorder: OutlineInputBorder(

                  borderSide: const BorderSide(
                      width: 2
                  )),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2
                  )
              ),
                        ),
                        validator: (value){
              if(value!.isEmpty){
                return 'Enter Email';
              }
              // else if(!emailRegex.hasMatch(value)) {
              //   return "Enter valid Email";
              // }
                        },
                        onFieldSubmitted: (value){

                        },
                      ),
            ),
        ],),
      ),
    );
  }
}
