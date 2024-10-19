import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unishare/res/components/rectangle_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // backgroundColor: Colors.black26,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                color: Colors.black26,
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount:1,
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        return  Hero(tag: index,
                            child: CachedNetworkImage(
          
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height*0.4,
                              imageUrl: "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                              placeholder: (context, url)=>Center(child: CircularProgressIndicator()),));
                      },
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height*0.4,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          autoPlay: true,
                          onPageChanged: (index,reason){}
                      ),),
                    Positioned(
                      bottom: 10,
                      left: MediaQuery.of(context).size.width*0.4,
                      child: AnimatedSmoothIndicator(
                      activeIndex: 1,
                      count:5,
                      effect: JumpingDotEffect(
                          activeDotColor: Colors.blue,
                          dotHeight:10,
                          dotWidth: 10
                      ),)),
                    Positioned(
                      top: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                          Icon(Icons.favorite_border_sharp,color: Colors.white,size: 30,)
                                          ],
                                        ),
                        )),
                    Positioned(right: 10,bottom: 10,
                        child: Text("2/4",style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30,left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" HONDA SP 125",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text(" ₹ 15000",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Divider(),
                    Text("Description",style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      color: Colors.black12,
                      child: Text(
                          "To display a rupee icon with text in Flutter, you can use the Row widget to place the rupee icon (₹) next to the text. Flutter provides the Icons class, but it does not have a built-in rupee icon. You can use the Text widget to directly display the rupee symbol instead. To display a rupee icon with text in Flutter, you can use the Row widget to place the rupee icon (₹) next to the text. Flutter provides the Icons class, but it does not have a built-in rupee icon. You can use the Text widget to directly display the rupee symbol instead. To display a rupee icon with text in Flutter, you can use the Row widget to place the rupee icon (₹) next to the text. Flutter provides the Icons class, but it does not have a built-in rupee icon. You can use the Text widget to directly display the rupee symbol instead."
                      ),
                    )
          
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Divider(color: Colors.black26,thickness: 3,),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                color: Colors.black12,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.red,
                      
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Posted by"),
                        Text("Lucky Motors",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text("Posted on 12/5/2024")
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 40,)
          
                
            ],
          ),
        ),


    );
  }
}
