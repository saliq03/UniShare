import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const Row(
          children: [
            Expanded(child: Divider(color: Colors.white,)),
            Text("  OR  ",style: TextStyle(color: Colors.white,fontSize: 20),),
            Expanded(child: Divider(color: Colors.white,)),
          ]);
  }
}
