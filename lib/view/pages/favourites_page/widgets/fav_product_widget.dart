import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/routes/routes_name.dart';
import '../../../../viewmodels/controller/home_controllers/favourites_controller.dart';
import 'details_row.dart';
import 'fav_icon_widget.dart';

class FavProductWidget extends StatelessWidget {
   FavProductWidget({required this.index,super.key});
   final int index;
  final favController=Get.put(FavouritesController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(RoutesName.productPage,arguments: favController.favProducts[index]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        child: Card(
          elevation: 5,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10,top: 10,bottom: 10,left: 10),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(8, 126, 139, 0.14),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DetailsRow(product: favController.favProducts[index],),
              ),
              Positioned(right: 10,bottom: 10,
                  child: FavIconWidget(productId:favController.favProducts[index].productId,))
            ],
          ),),),);
        }
   }
