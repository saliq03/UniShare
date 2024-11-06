import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/components/customized_back_button.dart';
import 'package:unishare/res/components/rectangle_button.dart';
import 'package:unishare/res/components/round_button.dart';

class UsersProfile extends StatefulWidget {
  const UsersProfile({super.key});

  @override
  State<UsersProfile> createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {
  late UserModel user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user=Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomizedBackButton(),
        ),
         body: Container(
           // padding: EdgeInsets.symmetric(horizontal: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Column(
                 children: [
                   const SizedBox(width: double.infinity),
                   Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(90),
                         border: Border.all(
                             color: Colors.green,
                             width: 3
                         )
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(90),
                       child: Hero(
                         tag: user.Photo,
                         child: CachedNetworkImage(
                           fit: BoxFit.cover,
                           width: 180,
                           height: 180,
                           imageUrl: user.Photo,
                           placeholder: (context,url)=>const Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
                       ),
                     ),
                   ),
                   SizedBox(height: 5,),
                   Text(user.Name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                   Text(user.Email,style: TextStyle(color: Color(0xFF979797),fontSize: 15,height: 1),),
                   SizedBox(height: 10,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                     child: Text(user.Bio,style: TextStyle(fontSize: 18,color: Color(0xFF979797),height: 1.3,),textAlign: TextAlign.center,),
                   ),
                 ],
               ),


               Container(
                 padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                 margin: EdgeInsets.only(left: 30,top: 20),
                 decoration: BoxDecoration(
                   color: Colors.blueAccent,
                   borderRadius: BorderRadius.circular(12)
                 ),
                 child: Text("Message",style: TextStyle(fontSize: 25,color: Colors.white),),
               ),
               Container(
                 margin: EdgeInsets.symmetric(vertical: 10),
                 height: 10,
                 color: Colors.grey,
               ),
               ListView.builder(
                 itemCount: 3,
                   itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.only(right: 10,top: 10,bottom: 10,left: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xFF087E8B).withOpacity(0.14),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [

                          Row(
                          children: [
                          Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 100,
                          width: 100,
                          child: CachedNetworkImage(
                            imageUrl: user.Photo,
                            placeholder: (context,url)=> Center(child: CircularProgressIndicator()),
                            errorWidget: (context,url,error)=>Center(child: Icon(Icons.error_outline,color: Colors.redAccent,)),
                            fit: BoxFit.cover,),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 200,
                                child: Text("I Phone",maxLines: 1,overflow: TextOverflow.ellipsis, softWrap: false,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                            Text('18-Dec-2023',style: TextStyle(fontSize: 16,color:Color(0xFF898989) ),),

                            Text("₹ 300",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                          ],
                        ),
                        ],
                      ),


                        Padding(
                    padding: const EdgeInsets.only(right: 1),
                     child: InkWell(
                     onTap: (){
                     // favController.addOrRemoveFromFavourites(productId);
                     },
                     child: Icon(Icons.favorite,size: 35,)),
                     )

                     ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
               })

             ],
           ),
         ),
    );
  }
}
