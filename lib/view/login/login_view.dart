import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/res/components/my_text_button.dart';
import 'package:unishare/view/login/widgets/continuewithgoogle_widget.dart';
import 'package:unishare/view/login/widgets/input_email_widget.dart';
import 'package:unishare/view/login/widgets/input_password_widget.dart';
import 'package:unishare/view/login/widgets/or_widget.dart';
import 'package:unishare/view/login/widgets/signup_row.dart';


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
             InputEmailWidget(),

              SizedBox(height: 20,),
              InputPasswordWidget(),
              SizedBox(height: 20),

              RoundButton(title: "LOGIN", onPress: (){},
              width:double.infinity,
              height: 55,),
              SizedBox(height: 10),

              MyTextButton(title: "Forgot Password?", onPress: (){}),
              SizedBox(height: 70),
              SignupRow(),
              SizedBox(height: 20),
              OrWidget(),
              SizedBox(height: 30),
              ContinuewithgoogleWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
