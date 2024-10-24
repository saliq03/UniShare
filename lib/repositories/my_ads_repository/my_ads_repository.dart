import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/product_model/product_model.dart';
import '../../model/user_model/user_model.dart';
import '../../viewmodels/user_prefrences/user_prefrences.dart';

class MyAdsRepository{
  Future<List<ProductModel>> FetchMyAds() async {
    UserModel user=await UserPrefrences().GetUser();
    try{
      final snapshot = await FirebaseFirestore.instance.collection("Products")
          .where('ProviderEmail', isEqualTo: user.Email)  // Filter products by IDs
          .get();
      final List<ProductModel> products = snapshot.docs.map((e) {
        return ProductModel.fromMap(e.data() as Map<String, dynamic>);
      }).toList();

      return products;
    }
    catch(e){
      print(e.toString());
      throw e;
    }

  }
  Future<void> RemoveProduct(String productId)async {
    try{
      await FirebaseFirestore.instance
          .collection('Products') // Replace with your actual collection
          .doc(productId) // myId is the document ID to be deleted
          .delete();
    } catch(e){
      print(e.toString());
    }

  }
  Future<void> DeleteProductImage(String imageUrl)async {
    try {
      final Reference storageRef = FirebaseStorage.instance.refFromURL(imageUrl);
      await storageRef.delete();
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> UpdateProductInfo(ProductModel product)async {
    print("in update product info method repo");
    print(product);
    try{
      await FirebaseFirestore.instance.collection('Products').doc(product.productId).
      update({
        "Title":product.title,
        "Price":product.price,
        "Description":product.description,
        "Images":product.images
      }).then((value){
        print("updated");
      });
    }catch(e){
      print("error:");
      print(e.toString());
    }
  }
}