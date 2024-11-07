import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/res/components/customized_back_button.dart';
import 'package:unishare/view/pages/my_adds/widgets/shimmer_widget.dart';
import 'package:unishare/view/pages/users_profile/widgets/products_shimmer_widget.dart';
import 'package:unishare/view/pages/users_profile/widgets/show_product_widget.dart';
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
    controller = Get.put(UsersProfileController(email: user.Email));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomizedBackButton(),
        ),
         body: Container(
           // padding: EdgeInsets.symmetric(horizontal: 20),
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Column(
                   children: [
                     const SizedBox(width: double.infinity),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(75),
                           border: Border.all(
                               color: Colors.green,
                               width: 2
                           )
                       ),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(75),
                         child: Hero(
                           tag: user.Photo,
                           child: CachedNetworkImage(
                             fit: BoxFit.cover,
                             width: 150,
                             height: 150,
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
                   color: Colors.grey.shade300,
                 ),
                 Obx((){
                   return
                     controller.loading.value?
                     const ProductsShimmerWidget():
                     ListView.builder(
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: controller.usersProducts.length,
                         itemBuilder: (context,index){
                           return ProductWidget(product: controller.usersProducts[index],);
                         });
                 })



             
               ],
             ),
           ),
         ),
    );
  }
}
