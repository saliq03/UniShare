import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/model/product_model/product_model.dart';
import 'package:unishare/repositories/my_ads_repository/my_ads_repository.dart';

class EditProductController extends GetxController{
  final myAdsRepo=MyAdsRepository();

  final titleController=TextEditingController().obs;
  final priceController=TextEditingController().obs;
  final descriptionController=TextEditingController().obs;
  RxList<String> images=<String>[].obs;


  // @override
  // void onInit(){
  //   super.onInit();
  //
  // }

  initializeControllers(ProductModel product){
    titleController.value.text=product.title;
    priceController.value.text=product.price;
    descriptionController.value.text=product.description;
  }

  Future<void> updateProduct(ProductModel product)async {
    ProductModel newproduct=ProductModel(
        productId: product.productId,
        title: titleController.value.text,
        description: descriptionController.value.text,
        images: images,
        category: product.category,
        price: priceController.value.text,
        createdAt: product.createdAt, providerEmail: product.providerEmail);
    myAdsRepo.UpdateProductInfo(newproduct);
  }


}