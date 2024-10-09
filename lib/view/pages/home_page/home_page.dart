import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unishare/res/assets/images_assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,size: 30,),
              hintText: "Find Books, Buckets and More..",
              hintStyle: TextStyle(color: Colors.black54,fontSize: 18
              ),
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black,
                   width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2))
            ),
          ),
          SizedBox(height: 10,width: double.infinity,),
          Expanded(
            child: GridView.builder(
              itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.7
                    ),
                itemBuilder: (context,index){
                return Card(
                  elevation: 5,
                  child: Container(
             // color: Colors.white54,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            // The Image in the background
                            Hero(
                              tag: index,
                              child: Image.asset(
                                ImagesAssets.demoImg,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
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
                        Text("Free",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),
                        Text("Drafter blue".toUpperCase(),style: TextStyle(fontSize: 15,),)
                      ],
                    ),
                  ),

                );
                }),
          )
        ],

      ),
    );
  }
}
