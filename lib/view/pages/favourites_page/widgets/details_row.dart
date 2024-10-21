import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unishare/model/product_model/product_model.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({required this.product, super.key});
   final  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,right: 20),
          height: 100,
          width: 100,
          child: CachedNetworkImage(
              imageUrl: product.images[0],
              placeholder: (context,url)=> Center(child: CircularProgressIndicator()),
              errorWidget: (context,url,error)=>Center(child: Icon(Icons.error_outline,color: Colors.redAccent,)),
               fit: BoxFit.cover,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(width: 200,
                child: Text(product.title,maxLines: 1,overflow: TextOverflow.ellipsis, softWrap: false,style: TextStyle(fontSize: 20),)),
          ],
        ),
      ],
    );
  }
}
