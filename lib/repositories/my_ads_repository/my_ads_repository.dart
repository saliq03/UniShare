import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

import '../../model/product_model/product_model.dart';
import '../../model/user_model/user_model.dart';
import '../../viewmodels/user_prefrences/user_prefrences.dart';

class MyAdsRepository{

  final firebaseServices=FirebaseServices();
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
      firebaseServices.deleteData('Products', productId);
    } catch(e){
      print(e.toString());
    }

  }

  Future<void> DeleteProductImage(String imageUrl)async {
    try {
      firebaseServices.DeleteImage(imageUrl);
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> UpdateProductInfo(ProductModel product)async {
    Map<String, dynamic> data={
      "Title":product.title,
      "Price":product.price,
      "Description":product.description,
      "Images":product.images
    };
    try{
      firebaseServices.updateData('Products', product.productId, data).then((value){
        print("updated");
      });
    }catch(e){
      print("error:");
      print(e.toString());
    }
  }
}