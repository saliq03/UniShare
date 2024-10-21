import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,right: 20),
          height: 100,
          width: 100,
          color: Colors.purple,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" 121232",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(width: 200,
                child: Text("Tag Heuerjhkhjhiuhiuhiu Indy 500",maxLines: 1,overflow: TextOverflow.ellipsis, softWrap: false,style: TextStyle(fontSize: 20),)),
          ],
        ),
      ],
    );
  }
}
