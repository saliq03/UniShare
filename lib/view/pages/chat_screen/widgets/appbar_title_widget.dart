import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarTitleWidget extends StatelessWidget {
  const AppbarTitleWidget({required this.photo,required this.name,super.key});
  final String photo,name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width:50,height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),

          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(imageUrl: photo,
            placeholder: (context,url)=>Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
          ),

        ),
        SizedBox(width: 10,),
        Text(name,style: TextStyle(fontSize: 25),),

      ],
    );
  }
}
