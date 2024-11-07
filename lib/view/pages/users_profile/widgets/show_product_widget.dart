import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/model/product_model/product_model.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/viewmodels/controller/home_controllers/favourites_controller.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({required this.product,super.key});
  final ProductModel product;
  final favController=Get.put(FavouritesController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
      child: GestureDetector(
        onTap: (){
          Get.toNamed(RoutesName.productPage,arguments: product);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3), // Adjust radius as needed
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10,top: 5,bottom: 5,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              height: 140,
                              width: 130,
                              child: CachedNetworkImage(
                                imageUrl: product.images[0],
                                placeholder: (context,url)=> const Center(child: CircularProgressIndicator()),
                                errorWidget: (context,url,error)=>const Center(child: Icon(Icons.error_outline,color: Colors.redAccent,)),
                                fit: BoxFit.cover,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("₹ ${product.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                SizedBox(width: 200,
                                    child: Text(product.title,maxLines: 1,overflow: TextOverflow.ellipsis, softWrap: false,style: TextStyle(fontSize: 20,color:Color(0xFF898989),fontWeight: FontWeight.bold),)),
                                Text('18-Dec-2023',style: TextStyle(fontSize: 16,color:Color(0xFF898989) ),),



                              ],
                            ),
                          ],
                        ),





                      ],
                    ),

                  ],
                ),
              ),
              Positioned(
                right: 10,top: 10,
                child: InkWell(
                    onTap: (){
                      favController.addOrRemoveFromFavourites(product.productId);
                    },
                    child:Obx((){
                      return favController.favourites.contains(product.productId)?
                      Icon(Icons.favorite_outlined,size: 35,):
                      Icon(Icons.favorite_outline_sharp,size: 35,);
                    })
                    )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
