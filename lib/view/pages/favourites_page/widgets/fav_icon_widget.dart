import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../viewmodels/controller/home_controllers/favourites_controller.dart';

class FavIconWidget extends StatelessWidget {
   FavIconWidget({required this.productId,super.key});

   final String productId;
  final favController=Get.put(FavouritesController());

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: (){
         favController.addOrRemoveFromFavourites(productId);
        },
          child: CircleAvatar(
              backgroundColor:Colors.white,
              child: Center(child: Icon(Icons.favorite,color:Colors.red.shade500,size: 25,))));
  }
}
