import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/product_model/product_model.dart';

class UsersProfileRepository{

  Future<List<ProductModel>> fetchUsersProducts(String email) async {

    try{
      final snapshot = await FirebaseFirestore.instance.collection("Products")
          .where('ProviderEmail', isEqualTo: email)
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