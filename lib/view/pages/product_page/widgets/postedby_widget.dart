import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unishare/res/components/my_text_button.dart';
import 'package:unishare/res/routes/routes_name.dart';

import '../../../../res/colors/app_colors.dart';
import '../../../../viewmodels/controller/home_controllers/productpage_controller.dart';

class PostedbyWidget extends StatelessWidget {
   PostedbyWidget({ required this.postedOn,super.key});
  final String postedOn;
   final controller=Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Divider(color: Colors.black26,thickness: 3,),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                  color: AppColors.loginGradient1
              )
          ),

          child: Obx((){
            return controller.owner.value==null?
            Shimmer.fromColors(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,

                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(color: Colors.white,width: 100,height: 10,),
                      SizedBox(height: 10,),
                      Container(color: Colors.white,width: 90,height: 10),
                      SizedBox(height: 10,),
                      Container(color: Colors.white,width: 150,height: 10)
                    ],
                  )
                ],
              ),
              baseColor: Colors.grey.shade700,
              highlightColor: Colors.grey.shade100,)
                : Row(
              children: [
                Container(
                  width: 80,height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Hero(
                      tag: controller.owner.value!.Photo,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: controller.owner.value!.Photo,
                      placeholder: (context,url)=>Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Posted by"),
                    Text(controller.owner.value!.Name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("Posted on: $postedOn"),
                    const SizedBox(height: 10,),
                    MyTextButton(title: " See profile", onPress: (){
                      controller.seeProfile();
                    },fontSize: 18, titleColor: AppColors.loginGradient2,)
                  ],
                )
              ],
            );
          })

        ),
      ],
    );
  }
}
