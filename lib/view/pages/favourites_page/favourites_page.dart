import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/pages/favourites_page/widgets/details_row.dart';
import 'package:unishare/view/pages/favourites_page/widgets/fav_icon_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/favourites_controller.dart';

import '../../../res/components/customized_back_button.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final favController=Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(" My Favourites",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          leading: const CustomizedBackButton()
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
          width:  double.infinity,
          height: double.infinity,
          child:Obx((){
            if(favController.loading.value) {
            return ListView.builder(itemCount: 4,
                itemBuilder: (context,index){
              return Shimmer.fromColors(
                child: ListTile(
                  leading: Container(
                    height: 100,width: 100,
                    color: AppColors.white,
                  ),
                  title: Container(
                    height: 10,width: 100,
                    color: AppColors.white,
                  ),
                  subtitle: Container(
                    height: 8,width: 200,
                    color: AppColors.white,
                  ),
                ),
                baseColor: Colors.grey.shade700,
                highlightColor: Colors.grey.shade100,);
            });
           }
            else{
               if(favController.favProducts.length>0){
                 return ListView.builder(
                     itemCount: favController.favProducts.length,
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context,index){
                       return InkWell(
                         onTap: (){
                           Get.toNamed(RoutesName.productPage,arguments: favController.favProducts[index]);
                         },
                         child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                           child: Card(
                             elevation: 5,
                             child: Container(
                               padding: EdgeInsets.only(right: 10,top: 10,bottom: 10,left: 10),
                               decoration: BoxDecoration(
                                   color: Color(0xFF087E8B).withOpacity(0.14),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 children: [
                                   Row(
                                     mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                     children: [
                                       DetailsRow(product: favController.favProducts[index],),
                                       FavIconWidget(productId:favController.favProducts[index].productId,)
                                     ],
                                   ),

                                 ],
                               ),
                             ),
                           ),
                         ),
                       );
                     });
               }
               else{
                 return Center(child: Text("No Data"));
               }
            }
          })



        ),
    );
  }
}
