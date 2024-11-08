import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/routes/routes_name.dart';

class AppbarTitleWidget extends StatelessWidget {
  const AppbarTitleWidget({required this.user,super.key});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RoutesName.usersProfile,arguments:user );
      },
      child: Row(
        children: [
          const SizedBox(width: 20,),
           Container(
              width:50,height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(imageUrl: user.Photo,
                placeholder: (context,url)=>const Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
              ),

            ),

          const SizedBox(width: 10,),
          Text(user.Name,style: const TextStyle(fontSize: 25),),

        ],
      ),
    );
  }
}
