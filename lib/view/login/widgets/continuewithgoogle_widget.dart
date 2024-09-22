import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';

class ContinuewithgoogleWidget extends StatelessWidget {
  const ContinuewithgoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 8,
        color: Colors.white,
        shadowColor: Colors.black26,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Image.asset(IconsAssets.google,width: 30,height: 30,),
            ),
            Text("Continue with Google",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
