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
                   width: 2
                 )
              )
            ),
          ),
          SizedBox(height: 10,width: double.infinity,),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.8
                    ),
                itemBuilder: (context,index){
                return Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: GridTile(
                        child: Hero(tag: index,
                            child:Image.asset(ImagesAssets.demoImg,height: 100,fit: BoxFit.cover,) ),
                      footer: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Free",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 20),),
                            Text("Drafter blue")
                          ],
                        ),
                      ),
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
