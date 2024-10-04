import 'package:flutter/cupertino.dart';

import '../../../../res/assets/icons_assets.dart';

class WritingWidgetFp extends StatelessWidget {
  const WritingWidgetFp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(IconsAssets.lock,width: 100,),
        const SizedBox(height: 20,width: double.infinity,),
        const SizedBox(height: 20,width: double.infinity,),
        const Text("Forget\nPassword",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, height: 1.0),),
        const SizedBox(height: 10,),
        const Text("Please Enter your registered email to reset your password!",textAlign: TextAlign.center,style: TextStyle(fontSize: 19),),
        const SizedBox(height: 30,),
      ],
    );
  }
}
