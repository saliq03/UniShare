import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title:  Text(" My ADS",style: Theme.of(context).textTheme.headlineMedium,),
       leading: const CustomizedBackButton()
      ),
      body: Obx((){
        if(myAdsController.loading.value){
          return ShimmerWidget();
        }
        else{
          if(myAdsController.myProducts.isEmpty){
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
