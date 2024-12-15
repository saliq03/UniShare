import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

import '../../model/product_model/product_model.dart';
import '../../model/user_model/user_model.dart';
import '../../viewmodels/user_prefrences/user_prefrences.dart';

class MyAdsRepository{

  final firebaseServices=FirebaseServices();
  Future<List<ProductModel>> fetchMyAds() async {
    UserModel user=await UserPrefrences().getUser();
    try{
      final snapshot = await FirebaseFirestore.instance.collection("Products")
          .where('ProviderEmail', isEqualTo: user.email)  // Filter products by IDs
          .get();
      final List<ProductModel> products = snapshot.docs.map((e) {
        return ProductModel.fromMap(e.data());
      }).toList();

      return products;
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }

  }
  
  Future<void> removeProduct(String productId)async {
    try{
      firebaseServices.deleteData('Products', productId);
    } catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }

  Future<void> deleteProductImage(String imageUrl)async {
    try {
      firebaseServices.deleteImage(imageUrl);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> updateProductInfo(ProductModel product)async {
    Map<String, dynamic> data={
      "Title":product.title,
      "Price":product.price,
      "Description":product.description,
      "Images":product.images
    };
    try{
      firebaseServices.updateData('Products', product.productId, data).then((value){
      });
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}