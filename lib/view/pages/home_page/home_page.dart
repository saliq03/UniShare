import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:unishare/view/pages/home_page/widgets/search_widget.dart';
import 'package:unishare/view/pages/home_page/widgets/show_product_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SearchWidget(),
          const SizedBox(height: 10,width: double.infinity,),
          Obx((){
            return Expanded(
              child: homeController.products.isEmpty? Center(child: CircularProgressIndicator())
                  :GridView.builder(
                  itemCount: homeController.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 0.65
                  ),
                  itemBuilder: (context,index){
                    return  ShowProductWidget(index: index);
                  }),
            );
          })

        ],

      ),
    );
  }
}
