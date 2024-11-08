import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/model/product_model/product_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/repositories/home_repository/home_repository.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../res/assets/images_assets.dart';

class HomeController extends GetxController{
  final homeRepository=HomeRepository();

  final searchController=TextEditingController().obs;
  final searchFocusNode=FocusNode().obs;
  var searchText = ''.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  List<ProductModel> allProducts = [];
  final loading=false.obs;





  @override
  void onInit() {
    super.onInit();
    print("onInit method called");
    getProducts();
  }



  refreshController(){
    getProducts();
  }


   getProducts() async {
    loading.value=true;
    UserModel currUser=await UserPrefrences().GetUser();
     try{
       List<ProductModel> fetchedProducts = await homeRepository.getAllProducts(currUser.Email);
       allProducts = fetchedProducts; // Initialize allProducts with fetched products
       products.assignAll(allProducts);
       loading.value=false;
       update();
     }catch(e){
       loading.value=false;
       print(e.toString());
     }
   }

  void filterProducts(String query) {
    if (query.isEmpty) {
      products.assignAll(allProducts); // Show all if query is empty
    } else {
      products.assignAll(
          allProducts.where((product) {
            final titleMatches = product.title.toLowerCase().contains(query.toLowerCase());
            final categoryMatches = product.category.toLowerCase().contains(query.toLowerCase());
            return titleMatches || categoryMatches;
          }).toList()
      );
    }
  }

  void onSearchTextChanged(String value) {
    searchText.value = value;
    filterProducts(value);
  }

}