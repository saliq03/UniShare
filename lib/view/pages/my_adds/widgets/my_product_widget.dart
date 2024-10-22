import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:unishare/model/product_model/product_model.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/view/pages/edit_product_page/edit_product_page.dart';
import 'package:unishare/viewmodels/controller/home_controllers/my_ads_controller.dart';

class MyProductWidget extends StatelessWidget {
  MyProductWidget({required this.myProduct, super.key});
   final ProductModel myProduct;

   final myAdsController=Get.put(MyAdsController());
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FROM: ${DateFormat('dd-MM-yyyy').format(myProduct.createdAt.toDate())}"),
                PopupMenuButton(
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
                    ])

              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: CachedNetworkImage(imageUrl: myProduct.images[0],
                    placeholder: (context,url)=> const Center(child: CircularProgressIndicator(),),
                    errorWidget: (context,url,error)=> const Center(child: Icon(Icons.error_outline,color: Colors.red,)),
                    fit: BoxFit.cover,),
                ),
                SizedBox(width: 20,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 200,
                        child: Text(myProduct.title,maxLines: 1,overflow: TextOverflow.ellipsis, softWrap: false,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                    Text(myProduct.price=="Free"? "Free":"₹ ${myProduct.price}",style: const TextStyle(fontSize: 20),)
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,)


          ],
        ),
      ),
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
