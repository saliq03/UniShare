import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/model/product_model/product_model.dart';
import 'package:unishare/repositories/my_ads_repository/my_ads_repository.dart';
import 'package:unishare/viewmodels/controller/home_controllers/my_ads_controller.dart';

import 'home_controller.dart';

class EditProductController extends GetxController{
  final myAdsRepo=MyAdsRepository();

  final titleController=TextEditingController().obs;
  final priceController=TextEditingController().obs;
  final descriptionController=TextEditingController().obs;

  final titleFocusNode=FocusNode().obs;
  final priceFocusNode=FocusNode().obs;
  final descriptionFocusNode=FocusNode().obs;
  RxList<String> images=<String>[].obs;




  initializeControllers(ProductModel product){

    titleController.value.text=product.title;
    product.price=="Free" ?
    priceController.value.text=0.toString() :priceController.value.text=product.price;
    descriptionController.value.text=product.description;
  }

  Future<void> updateProduct(ProductModel product)async {
    print("in update product method controller");

    ProductModel newproduct=ProductModel(
        productId: product.productId,
        title: titleController.value.text,
        description: descriptionController.value.text,
        images: product.images,
        category: product.category,
        price:
        double.tryParse(priceController.value.text)!<1? "Free":priceController.value.text,
          createdAt: product.createdAt,
        providerEmail: product.providerEmail);
    myAdsRepo.UpdateProductInfo(newproduct).then((value){
      HomeController homeController = Get.find<HomeController>();
      MyAdsController myAdsController=Get.find<MyAdsController>();
      myAdsController.refreshController();
      homeController.refreshController();
      for(int i=0;i<images.length;i++){
        myAdsRepo.DeleteProductImage(images[i]);
      }
    });
  }


}