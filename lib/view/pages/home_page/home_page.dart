import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/view/pages/home_page/widgets/category_row.dart';

import 'package:unishare/view/pages/home_page/widgets/search_widget.dart';
import 'package:unishare/view/pages/home_page/widgets/show_product_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/home_controller.dart';

import '../../../res/colors/app_colors.dart';
import 'widgets/drawer_icon.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerIcon(),
              const Text("UniShare",style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: "FiraSans",color: AppColors.loginGradient3),),
              const SizedBox(width: 10,)
            ],
          ),
          SearchWidget(),
          const SizedBox(height: 10,width: double.infinity,),
          Obx((){
            return Expanded(
              child: homeController.loading.value? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          CategoryRow(),
                          const SizedBox(height: 10,),
                          homeController.products.isEmpty?
                          SizedBox(height: MediaQuery.of(context).size.height*0.5,
                              child: Center(child: Text("Couldn't find products",style: TextStyle(fontSize: 18,color: Colors.grey.shade700),))):
                          GridView.builder(
                              shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: homeController.products.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                              childAspectRatio: 0.65
                                              ),
                                              itemBuilder: (context,index){
                              return  ShowProductWidget(index: index);
                                              }),

                        ],
                      ),
                    ),
            );
          })

        ],

      ),
    );
  }
}
