import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/components/customized_back_button.dart';
import 'package:unishare/view/pages/users_profile/widgets/call_button_widget.dart';
import 'package:unishare/view/pages/users_profile/widgets/message_button_widget.dart';
import 'package:unishare/view/pages/users_profile/widgets/products_widget.dart';
import 'package:unishare/view/pages/users_profile/widgets/user_information_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/users_profile_controller.dart';


class UsersProfile extends StatefulWidget {
  const UsersProfile({super.key});

  @override
  State<UsersProfile> createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {
  late UserModel user;
  late UsersProfileController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user=Get.arguments;
    controller = Get.put(UsersProfileController(email: user.email));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomizedBackButton(),
        ),
         body: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               UserInformationWidget(user: user),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   MessageButtonWidget(user: user),
                   CallButtonWidget(target: user)
                 ],
               ),
               Container(
                 margin: EdgeInsets.symmetric(vertical: 10),
                 height: 10,
                 color: Colors.grey.shade300,
               ),
               ProductsWidget(controller: controller)




             ],
           ),
         ),
    );
  }
}
