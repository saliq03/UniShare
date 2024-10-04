import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/components/rectangle_button.dart';
import 'package:unishare/view/authentication/forget_password/widgets/fp_intput_email_widget.dart';
import 'package:unishare/view/authentication/forget_password/widgets/fp_reset_password_button.dart';
import 'package:unishare/view/authentication/forget_password/widgets/writing_widget_fp.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const WritingWidgetFp(),
               FpIntputEmailWidget(),


              SizedBox(height: 20,),
             FpResetPasswordButton(formKey: _formKey),
          ],),
        ),
      ),
    );
  }
}
