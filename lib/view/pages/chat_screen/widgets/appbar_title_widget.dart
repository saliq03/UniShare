import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/viewmodels/controller/home_controllers/chat_screen_controller.dart';

class AppbarTitleWidget extends StatelessWidget {
   AppbarTitleWidget({required this.user,super.key});
   final chatController=Get.put(ChatScreenController());
  final UserModel user;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RoutesName.usersProfile,arguments:user );
      },
      child: StreamBuilder(
        stream: chatController.getStatus(user.Email),
        builder: (context, snapshot) {
          return Row(
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
                    child: CachedNetworkImage(imageUrl: snapshot.data!.Photo,
                    placeholder: (context,url)=>const Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
                  ),

                ),

              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data!.Name,style: const TextStyle(fontSize: 25),),
                  Text(snapshot.data!.Status,style: TextStyle(fontSize: 13,color:  snapshot.data!.Status=='Online'?Colors.green:Colors.grey),)
                ],
              ),

            ],
          );
        }
      ),
    );
  }
}
