import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../viewmodels/controller/home_controllers/favourites_controller.dart';

class FavIconWidget extends StatelessWidget {
   FavIconWidget({required this.productId,super.key});

   final String productId;
  final favController=Get.put(FavouritesController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: InkWell(
        onTap: (){
         favController.addOrRemoveFromFavourites(productId);
        },
          child: Icon(Icons.favorite,size: 35,)),
    );
  }
}
