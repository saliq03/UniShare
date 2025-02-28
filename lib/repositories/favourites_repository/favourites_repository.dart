import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../model/product_model/product_model.dart';

class FavouritesRepository{

  addToFavourites(String productId) async {
    UserModel user=await UserPrefrences().getUser();
    try{
      await FirebaseFirestore.instance.
      collection("Users").
      doc(user.email).
      collection("Favourites").
      doc(productId).set({
        "ProductId": productId,
      });
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }


  }

  RemoveFromFavourites(String productId) async {
    UserModel user=await UserPrefrences().getUser();
    try{
      await FirebaseFirestore.instance.
      collection("Users").
      doc(user.email).
      collection("Favourites").
      doc(productId).delete();
    } catch(e){
      print(e.toString());
    }
  }

  Future<List<String>> GetFavourites() async {
    UserModel user=await UserPrefrences().getUser();
  try{
    final snapshot = await FirebaseFirestore.instance.
    collection("Users").
    doc(user.email).
    collection("Favourites").get();

    final List productIds = snapshot.docs.map((e) {
      return e.data()["ProductId"] as String;
    }).toList();
    return productIds as List<String> ;
  } catch(e){
    print(e.toString());
    throw e;

  }

  }

  Future<List<ProductModel>> FetchFavouriteProducts(List<String> ids) async {
        print("fetch fav products method called");
    try {
      if(ids.isEmpty){
        return [];
      }
      final snapshot = await FirebaseFirestore.instance.collection("Products")
          .where('ProductId', whereIn: ids)  // Filter products by IDs
          .get();
      final List<ProductModel> products = snapshot.docs.map((e) {
        return ProductModel.fromMap(e.data() as Map<String, dynamic>);
      }).toList();

      return products;
    } catch(e){
      print(e.toString());
      throw e;
    }

  }
}