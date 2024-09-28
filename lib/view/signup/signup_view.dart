import 'package:flutter/material.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/view/signup/widgets/login_row.dart';
import 'package:unishare/view/signup/widgets/signup_confirmpassword_widget.dart';
import 'package:unishare/view/signup/widgets/signup_input_email_widget.dart';
import 'package:unishare/view/signup/widgets/signup_name_widget.dart';
import 'package:unishare/view/signup/widgets/signup_password_widget.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
            gradient:LinearGradient(colors: [
              AppColors.loginGradient1,
              AppColors.loginGradient2,
              AppColors.loginGradient3,
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
        ),
        child:Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              SignupNameWidget(),
              SizedBox(height: 20),
             SignupInputEmailWidget(),
              SizedBox(height: 20),
              SignupPasswordWidget(),
              SizedBox(height: 20),
              SignupConfirmpasswordWidget(),
              SizedBox(height: 20),
              RoundButton(title: "Sign Up", onPress: (){
                if(_formKey.currentState!.validate()){

                }
              },
                width:double.infinity,
                height: 55,
                titleColor: AppColors.loginGradient1,),
              Spacer(),
              LoginRow(),
              SizedBox(height: 50,)







            ],
          ),
        ),

      ),
    );
  }
}
