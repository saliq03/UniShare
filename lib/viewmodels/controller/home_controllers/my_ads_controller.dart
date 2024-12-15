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
    getMyProducts().then((value){
      loading.value=false;
    });
  }

  refreshController(){
    getMyProducts();
  }

  Future<void> getMyProducts()async{
    myProducts.value= await myAdsRepository.fetchMyAds();
    update();
  }
 Future<void> removeMyProduct(ProductModel product)async {
    for(int i=0;i<product.images.length;i++){
      myAdsRepository.deleteProductImage(product.images[i]);
    }
    myAdsRepository.removeProduct(product.productId).then((value){
      getMyProducts();
    });
  }
}