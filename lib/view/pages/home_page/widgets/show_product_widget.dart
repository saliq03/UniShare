import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/viewmodels/controller/home_controllers/favourites_controller.dart';
import '../../../../viewmodels/controller/home_controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowProductWidget extends StatelessWidget {
   ShowProductWidget({super.key, required this.index});
  final int index;

  final homeController=Get.put(HomeController());
  final favouritesController=Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(RoutesName.productPage,arguments:homeController.products[index] );
      },
      child: Card(
        color:Color(0xFFFFFFFF),
        elevation: 5,
        child:Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0x3FC1839F),
              ),

              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // The Image in the background
                      Hero(
                        tag: homeController.products[index].images[0],
                        child: CachedNetworkImage(
                          height: 180,
                          width:  double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: homeController.products[index].images[0],
                          placeholder: (context,url)=>Center(child: CircularProgressIndicator( )),
                          errorWidget: (context,url,error)=> Icon(Icons.error_outline,color: Colors.red,),),

                      ),
                      // The CircleAvatar positioned at the top-right
                      Positioned(
                        top: 3,
                        right: 3, // Change left to right
                        child: InkWell(
                          onTap: (){
                            favouritesController.addOrRemoveFromFavourites(homeController.products[index].productId);
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Obx((){
                                return favouritesController.favourites.contains(homeController.products[index].productId)?
                                Icon(Icons.favorite,color: Colors.redAccent,)
                                    :Icon(Icons.favorite_border);
                              })
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: double.infinity,
              color: const Color(0xFFFFFFFF),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text(homeController.products[index].price=="Free"?"Free": "₹ ${homeController.products[index].price}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),
                  Text(capitalizeEachWord(homeController.products[index].title),style:  TextStyle(fontSize: 22,fontFamily: "FiraSans",fontWeight: FontWeight.w500,),maxLines: 1, // Single line
                    overflow: TextOverflow.ellipsis, softWrap: false,)
                ],
              ),
            )
          ],
        )

      ),
    );
  }


   String capitalizeEachWord(String text) {
     if (text.isEmpty) return text;
     return text
         .split(' ')
         .map((word) => word.isNotEmpty
         ? word[0].toUpperCase() + word.substring(1).toLowerCase()
         : '')
         .join(' ');
   }
}
