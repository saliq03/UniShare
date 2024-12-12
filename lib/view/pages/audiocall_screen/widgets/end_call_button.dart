import 'package:flutter/material.dart';

class EndCallButton extends StatelessWidget {
  const EndCallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.red,
        child: Icon(Icons.call_end_sharp,color: Colors.white,size: 30,),
      ),
    );
  }
}
