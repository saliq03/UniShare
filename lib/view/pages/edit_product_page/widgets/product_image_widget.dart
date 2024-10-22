import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({required this.images,super.key});
 final List images;
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 210,
          color: Colors.black54,
          child:Stack(
       children: [
         CarouselSlider.builder(
           itemCount:images.length,
           itemBuilder: (BuildContext context, int index, int realIndex) {
             return  Hero(tag: images[0],
                 child: CachedNetworkImage(
                   fit: BoxFit.fitHeight,

                   imageUrl: images[index],
                   placeholder: (context, url)=>Center(child: CircularProgressIndicator()),));
           },
           options: CarouselOptions(
               height: MediaQuery.of(context).size.height*0.4,
               enlargeCenterPage: true,
               viewportFraction: 1,
               // autoPlay: true,
               enlargeStrategy: CenterPageEnlargeStrategy.height,
               onPageChanged: (index,reason){
                 // controller.activeIndex.value=index;
               }
           ),),
         Positioned(
             top: 5,left: 5,
             child: Icon(Icons.delete,color: Colors.grey,size: 30,))
       ],
          ) );
  }
}
