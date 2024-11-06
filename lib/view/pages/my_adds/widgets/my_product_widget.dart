import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:unishare/model/product_model/product_model.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/viewmodels/controller/home_controllers/my_ads_controller.dart';

class MyProductWidget extends StatelessWidget {
  MyProductWidget({required this.myProduct, super.key});
   final ProductModel myProduct;

   final myAdsController=Get.put(MyAdsController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
      child: Card(
        elevation: 5,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF087E8B).withOpacity(0.14),
                borderRadius: BorderRadius.circular(10)
            ),

              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: CachedNetworkImage(imageUrl: myProduct.images[0],
                            placeholder: (context,url)=> const Center(child: CircularProgressIndicator(),),
                            errorWidget: (context,url,error)=> const Center(child: Icon(Icons.error_outline,color: Colors.red,)),
                            fit: BoxFit.cover,),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5,),
                          SizedBox(width: 200,
                              child: Text(myProduct.title,maxLines: 1,overflow: TextOverflow.ellipsis, softWrap: false,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                          Text(DateFormat('dd-MMM-yyyy').format(myProduct.createdAt.toDate()),style: TextStyle(fontSize: 16,color:Color(0xFF898989) ),),
                          Text(myProduct.price=="Free"? "Free":"₹ ${myProduct.price}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  )),
          Positioned(
            right: 5,
            top: 0,
            child: PopupMenuButton(
                icon: Icon(Icons.more_horiz,size: 30,),
                onSelected: (value){
                  if (value == 'edit info') {

                    Get.toNamed(RoutesName.editProductPage,arguments: myProduct);
                  } else if (value == 'remove') {
                    showDeleteConfirmationDialog(context, myProduct);
                  }
                },
                itemBuilder: (context)=>[
                  PopupMenuItem(
                    value: 'edit info',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit Info'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'remove',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Remove'),
                    ),
                  ),
                ]),
          )
        ],
      )),
    );
  }

  showDeleteConfirmationDialog(BuildContext context,ProductModel product){
    showDialog(
        context: context, builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Remove product"),
            content: const Text('Are you sure you want to remove this product?'),
            actions: [
          TextButton(
          child: const Text('Cancel'),
          onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
         }),

              TextButton(
                  child: const Text('Remove'),
                  onPressed: () {
                    myAdsController.removeMyProduct(product).then((value){
                      Utils.snackBar("Removed", "Product removed Sucessfully");
                    });
                    Navigator.of(context).pop();// Close the dialog
                  }),

            ],
          );
    });
  }
}
