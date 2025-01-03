import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/res/components/my_text_button.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/authentication/login/widgets/continuewithgoogle_widget.dart';
import 'package:unishare/view/authentication/login/widgets/input_email_widget.dart';
import 'package:unishare/view/authentication/login/widgets/input_password_widget.dart';
import 'package:unishare/view/authentication/login/widgets/or_widget.dart';
import 'package:unishare/view/authentication/login/widgets/signup_row.dart';

import '../../../viewmodels/controller/login_controller.dart';



class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
 final loginController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          gradient:LinearGradient(colors: [
            AppColors.loginGradient1,
            AppColors.loginGradient2,
            AppColors.loginGradient3,
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
              const SizedBox(height: 20,),
              InputPasswordWidget(),
              const SizedBox(height: 20),

              Obx((){
                return RoundButton(title: "LOGIN", onPress: (){
                  if(_formKey.currentState!.validate()){
                    loginController.login();
                  }
                },
                  width:double.infinity,
                  height: 55,
                  titleColor: AppColors.loginGradient1,
                  loading: loginController.loading.value,);
              }),
              const SizedBox(height: 5),

              MyTextButton(title: "Forgot Password?", onPress: (){
                Get.toNamed(RoutesName.forgetPassword);
              }),
              const SizedBox(height: 70),
              const SignupRow(),
              const SizedBox(height: 20),
              const OrWidget(),
              const SizedBox(height: 30),
              ContinuewithgoogleWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
