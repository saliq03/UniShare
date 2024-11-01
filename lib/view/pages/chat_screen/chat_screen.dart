import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Row(
            children: [
              Container(
                  width:50,height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),

                  ),

              ),
              SizedBox(width: 10,),
              Text("Marouf",style: TextStyle(fontSize: 25),),

            ],
          ),
    ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.grey.shade200,)),
          Container(
            margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            padding: EdgeInsets.only(left: 10),
            height: 50,
            color: Colors.grey,
            child: TextFormField(

              decoration: InputDecoration(
                hintText: "Message...",
                border: InputBorder.none,           // Removes the border
                enabledBorder: InputBorder.none,     // Removes the enabled border (default)
                focusedBorder: InputBorder.none,
              ),
            ),
          )
        ],
      )

    );
  }
}
