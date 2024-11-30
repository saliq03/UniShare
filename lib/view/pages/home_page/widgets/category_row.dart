import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../res/components/category_button.dart';
import '../../../../viewmodels/controller/home_controllers/home_controller.dart';

class CategoryRow extends StatelessWidget {
 CategoryRow({super.key});

  final homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(title: "Books", onTap:() {homeController.onSearchTextChanged("Books");}),
          CategoryButton(title: "Games", onTap:() {homeController.onSearchTextChanged("Games");}),
          CategoryButton(title: "Music", onTap:() {homeController.onSearchTextChanged("Music");}),
          CategoryButton(title: "Camera", onTap:() {homeController.onSearchTextChanged("Camera");}),
        ]),

    );
  }
}
