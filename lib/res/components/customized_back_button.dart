import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomizedBackButton extends StatelessWidget {
  const CustomizedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.back(),
      child: Container(
          margin: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                  width: 1
              )
          ),
          child: const Center(child: Icon(CupertinoIcons.back))),
    );
  }
}
