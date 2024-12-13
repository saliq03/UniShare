import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/repositories/login_repository/login_repository.dart';
import 'package:unishare/view/pages/audiocall_screen/widgets/circle_widget.dart';
import 'package:unishare/view/pages/audiocall_screen/widgets/details_widget.dart';
import 'package:unishare/view/pages/audiocall_screen/widgets/end_call_button.dart';
import 'package:unishare/viewmodels/controller/home_controllers/call_controller.dart';

import '../../../model/user_model/user_model.dart';

class NotpickedCallPage extends StatefulWidget {
  const NotpickedCallPage({super.key});

  @override
  State<NotpickedCallPage> createState() => _NotpickedCallPageState();
}

class _NotpickedCallPageState extends State<NotpickedCallPage> {
  late UserModel target,caller;

  final callController=Get.put(CallController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final args = Get.arguments as Map<String, UserModel>;
    target =args["target"]!;
    caller=args["caller"]!;
   LoginRepository().fetchUser(target.Email).then((user){
     target=user;
     callController.callAction(target, caller);
   });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          color: Color(0xFF494A4D),
          height: double.infinity,
            width: double.infinity,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsWidget(user: target,),
              CircleWidget(name: target.Name),
             EndCallButton()
            ],
          ),
        ));
  }
}
