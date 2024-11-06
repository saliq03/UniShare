import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/components/customized_back_button.dart';
import 'package:unishare/view/pages/my_adds/widgets/my_product_widget.dart';
import 'package:unishare/view/pages/my_adds/widgets/shimmer_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/my_ads_controller.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
    final myAdsController=Get.put(MyAdsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" My ADS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
       leading: const CustomizedBackButton()
      ),
      body: Obx((){
        if(myAdsController.loading.value){
          return ShimmerWidget();
        }
        else{
          if(myAdsController.myProducts.length<1){
            return Center(child: Text("No Data"));
          }
          else{
            return ListView.builder(
                itemCount: myAdsController.myProducts.length,
                itemBuilder: (context,index){
                  return MyProductWidget(myProduct: myAdsController.myProducts[index]) ;
                });
          }
        }
        
      })
      
    );
  }
}
