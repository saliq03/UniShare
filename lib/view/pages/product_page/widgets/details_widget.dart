import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unishare/model/product_model/product_model.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({required this.product,super.key});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30,left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(" ${product.title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text(product.price=="Free"? " Free":" ₹ ${product.price}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:product.price=="Free"? Colors.green:Colors.black ),),
          SizedBox(height: 20,),
          Divider(),
          Text("Description",style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold),),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.black12,
            child: Text(product.description),
          )

        ],
      ),
    );
  }
}
