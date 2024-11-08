import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/view/pages/favourites_page/widgets/fav_product_widget.dart';
import 'package:unishare/view/pages/favourites_page/widgets/favourites_shimmer_widget.dart';
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
        padding: const EdgeInsets.only(top: 10),
          width:  double.infinity,
          height: double.infinity,
          child:Obx((){
            if(favController.loading.value) {
            return const FavouritesShimmerWidget();
           }
            else{
               if(favController.favProducts.isNotEmpty){
                 return ListView.builder(
                     itemCount: favController.favProducts.length,
                     physics: const BouncingScrollPhysics(),
                     itemBuilder: (context,index){
                       return FavProductWidget(index: index);
                     });
               }
               else{
                 return const Center(child: Text("No Data"));
               }
            }
          })



        ),
    );
  }
}
