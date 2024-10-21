import 'package:flutter/material.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADS"),
      ),
      body: ListView.builder(
        itemCount: 3,
          itemBuilder: (context,index){
          return Container(
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
                    Text("FROM: 15 OCT 2024"),
                    IconButton(onPressed: (){
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(100, 100, 0, 0), // Adjust the position as needed
                        items: [
                          PopupMenuItem(
                            value: 'edit',
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ),
                          PopupMenuItem(
                            value: 'remove',
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Remove'),
                            ),
                          ),
                        ],
                      ).then((value) {
                        if (value == 'edit') {
                          // Handle edit
                        } else if (value == 'remove') {
                          // Handle remove
                        }
                      });
                      
                    }, icon: Icon(Icons.more_horiz,size: 40,))
                  ],
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("one plus mobile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text(" 86",style: TextStyle(fontSize: 20),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,)


              ],
            ),
          );
      }),
    );
  }
}
