import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/res/routes/routes.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/view/signup/widgets/login_row.dart';
import 'package:unishare/view/signup/widgets/signup_confirmpassword_widget.dart';
import 'package:unishare/view/signup/widgets/signup_input_email_widget.dart';
import 'package:unishare/view/signup/widgets/signup_name_widget.dart';
import 'package:unishare/view/signup/widgets/signup_password_widget.dart';
import 'package:unishare/viewmodels/controller/signup_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final signupController=Get.put(SignupController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Obx((){
                return RoundButton(title:"Sign Up" , onPress: (){


                    if(_formKey.currentState!.validate()){

                     signupController.Signup(context);
                       }
                },
                  width:double.infinity,
                  height: 55,
                  titleColor: AppColors.loginGradient1,
                  loading: signupController.loading.value,);
              }),


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
