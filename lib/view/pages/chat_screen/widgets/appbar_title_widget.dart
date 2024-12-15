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
        stream: chatController.getStatus(user.email),
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
                    child: CachedNetworkImage(imageUrl: user.photo,
                    placeholder: (context,url)=>const Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
                  ),

                ),

              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,style: const TextStyle(fontSize: 25),),
                  !snapshot.hasData||snapshot.data==null?
                  Text("loading..",style: TextStyle(fontSize: 13,color:Colors.grey),) :
                  Text(snapshot.data!.status,style: TextStyle(fontSize: 13,color:  snapshot.data!.status=='Online'?Colors.green:Colors.grey),)
                ],
              ),

            ],
          );
        }
      ),
    );
  }
}
