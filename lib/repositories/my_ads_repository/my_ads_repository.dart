import 'package:cloud_firestore/cloud_firestore.dart';

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
}