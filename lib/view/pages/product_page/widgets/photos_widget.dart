import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unishare/viewmodels/controller/home_controllers/productpage_controller.dart';

class PhotosWidget extends StatelessWidget {
   PhotosWidget({required this.photos,super.key});
   final List photos;
   final controller=Get.put(ProductPageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      color: Colors.black26,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount:photos.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return  Hero(tag: photos[0],
                  child: CachedNetworkImage(

                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height*0.4,
                    imageUrl: photos[index],
                    placeholder: (context, url)=>Center(child: CircularProgressIndicator()),));
            },
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height*0.4,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index,reason){
                     controller.activeIndex.value=index;
                }
            ),),
          Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width*0.4,
              child: photos.length>1?Obx((){
                return AnimatedSmoothIndicator(
                  activeIndex: controller.activeIndex.value,
                  count:photos.length,
                  effect: JumpingDotEffect(
                      activeDotColor: Colors.blue,
                      dotHeight:10,
                      dotWidth: 10
                  ),);
              }):Container()),
          // Positioned(
          //     top: 10,
          //     child: Container(
          //       width: MediaQuery.of(context).size.width,
          //       padding: const EdgeInsets.symmetric(horizontal: 15),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Icon(Icons.arrow_back,color: Colors.white,size: 30,),
          //           Icon(Icons.favorite_border_sharp,color: Colors.white,size: 30,)
          //         ],
          //       ),
          //     )),

          Positioned(right: 10,bottom: 10,
              child: Obx((){
                return  Text("${controller.activeIndex.value+1}/${photos.length}",style: TextStyle(color: Colors.white),);
              }))

        ],
      ),
    );
  }
}
