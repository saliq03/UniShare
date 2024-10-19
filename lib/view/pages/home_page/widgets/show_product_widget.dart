import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../viewmodels/controller/home_controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowProductWidget extends StatelessWidget {
   ShowProductWidget({super.key, required this.index});
  final int index;

  final homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        // color: Colors.white54,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // The Image in the background
                Hero(
                  tag: homeController.products[index].productId,
                  // child: Image.network(
                  //   homeController.products[index].images[0],
                  //
                  //   height: 180,
                  //   width: double.infinity,
                  //   fit: BoxFit.fill,
                  // ),
                  
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
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(homeController.products[index].price,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),
            Text(homeController.products[index].title.toUpperCase(),style: TextStyle(fontSize: 15,),maxLines: 1, // Single line
              overflow: TextOverflow.ellipsis, softWrap: false,)
          ],
        ),
      ),

    );
  }
}
