import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/res/components/my_text_button.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          gradient:LinearGradient(colors: [
            Color(0xFF78398F),
          Color(0xff5f3489),
          Color(0xFF473085),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             TextFormField(
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
             ),
              SizedBox(height: 20,),
              TextFormField(
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
              ),
              SizedBox(height: 20),
              RoundButton(title: "LOGIN", onPress: (){},
              width:double.infinity,
              height: 55,),
              SizedBox(height: 10),
              MyTextButton(title: "Forgot Password?", onPress: (){}),
              SizedBox(height: 70),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Don't have an account?",style: TextStyle(color: Colors.white,fontSize: 18),),
              MyTextButton(title: "Sign Up", onPress: (){},fontSize: 19,)
             ],
             ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.white,)),
                  Text("  OR  ",style: TextStyle(color: Colors.white,fontSize: 20),),
                  Expanded(child: Divider(color: Colors.white,)),
                ]),
              SizedBox(height: 10),
              Text("Continue with",style: TextStyle(color: Colors.white,fontSize: 19),),
              SizedBox(height: 20),
              InkWell(
                child: Card(
                  elevation: 8,
                  color: Colors.white,
                  shadowColor: Colors.black26,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Image.asset(IconsAssets.google,width: 30,height: 30,),
                      ),
                      Text("Continue with Google",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
