import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/routes/routes_name.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({required this.user,super.key});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Get.toNamed(RoutesName.chatScreen,arguments: user);
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 5),
                  Container(
                    width:70,height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(35),

                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: CachedNetworkImage(imageUrl: user.Photo,
                        placeholder: (context,url)=>Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
                    ),

                  ),
                  SizedBox(width: 20,),
                  Text(user.Name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                ],
              ),
              Card(
                margin: EdgeInsets.only(right: 10),
                elevation: 5,
                child: Container(
                  height: 20,width:20,
                  decoration:BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("2",style: TextStyle(color: Colors.white),)),
                ),
              ),
            ],
          )


      ),
    );
  }
}
