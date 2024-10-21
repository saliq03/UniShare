import 'package:get/get.dart';
import 'package:unishare/repositories/my_ads_repository/my_ads_repository.dart';

import '../../../model/product_model/product_model.dart';

class MyAdsController extends GetxController{
  final myAdsRepository=MyAdsRepository();

  RxList<ProductModel> myProducts=<ProductModel>[].obs;
  final loading=false.obs;

  @override
  void onInit(){
    super.onInit();
    loading.value=true;
    GetMyProducts().then((value){
      loading.value=false;
    });
  }

  Future<void> GetMyProducts()async{
    myProducts.value= await myAdsRepository.FetchMyAds();
    update();
  }
}