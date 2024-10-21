import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unishare/model/product_model/product_model.dart';

class MyProductWidget extends StatelessWidget {
  const MyProductWidget({required this.myProduct, super.key});
   final ProductModel myProduct;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey,
                    width: 2
                )
            )
        ),
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
                        print("edit");
                        // Handle edit
                      } else if (value == 'remove') {
                        print("remove");
                        // Handle remove
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
                    Text(myProduct.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text(myProduct.price=="Free"? "Free":"₹ ${myProduct.price}",style: TextStyle(fontSize: 20),)
                  ],
                )
              ],
            ),
            SizedBox(height: 10,)


          ],
        ),
      ),
    );
  }
}
