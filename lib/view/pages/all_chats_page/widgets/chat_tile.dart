import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/routes/routes_name.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({required this.user,required this.lastChat,required this.lastTime,required this.lastSender,super.key});
  final UserModel user;
  final String lastChat,lastTime,lastSender;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Get.toNamed(RoutesName.chatScreen,arguments: user);
      },
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Container(

            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),

              borderRadius: BorderRadius.circular(15)
            ),
            child:Row(
              children: [
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.Name,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontFamily: "FiraSans",color: Color(0xFF3C3C3C),overflow: TextOverflow.ellipsis),),
                      Text("$lastSender: $lastChat",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "FiraSans",color: Color(0xFF8A8A8A)),
                        overflow: TextOverflow.ellipsis,
                      ),
                        ],
                      ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10,),
                    Card(
                      margin: EdgeInsets.only(right: 10),
                      elevation: 5,
                      child: Container(
                        height: 20,width:20,
                        decoration:BoxDecoration(
                            color: AppColors.loginGradient3,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("2",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(lastTime,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "FiraSans",color: Color(0xFF828282)),
                    ),
                  ],
                )

                  ],
                ),
            ),
      )

        
    );
  }
}
