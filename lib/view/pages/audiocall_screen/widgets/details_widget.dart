import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/constants/constants.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key,required this.user});
 final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(user.Name,style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500,fontFamily: "FiraSans"),),
        Text(user.Status=="Online"?CallStatus.ringing:CallStatus.calling,style: TextStyle(color: Colors.white60,fontSize: 16,fontFamily: "FiraSans"),)
      ],
    );
  }
}
