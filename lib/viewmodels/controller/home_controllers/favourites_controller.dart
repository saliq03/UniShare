
import 'package:get/get.dart';
import 'package:unishare/repositories/favourites_repository/favourites_repository.dart';

import '../../../model/product_model/product_model.dart';

class FavouritesController extends GetxController{
 var favourites=<String>[].obs;
 final favouritesRepository=FavouritesRepository();
 RxList<ProductModel> favProducts=<ProductModel>[].obs;
 final loading=false.obs;

 @override
 void onInit(){
  super.onInit();
  loading.value=true;
  getFavourites().then((value){
   getFavProducts();
   loading.value=false;
   update();
  });

 }

  Future<void> getFavourites()async{
  favourites.value = await favouritesRepository.GetFavourites();
  update();
 }

 removeFromFavourites(String id){
  favourites.remove(id);
  favouritesRepository.RemoveFromFavourites(id);
  print("removed from favourites");
  update();
 }

 addToFavourites(String id){
  favourites.add(id);
  favouritesRepository.AddToFavourites(id);
  print("added to favourites");
  update();
 }

 addOrRemoveFromFavourites(String id){
  if(favourites.contains(id)){
   removeFromFavourites(id);
  }
  else{
   addToFavourites(id);
  }
  getFavProducts();
  update();
 }

 getFavProducts() async {
  print("get favroute products method called");
  favProducts.value=await favouritesRepository.FetchFavouriteProducts(favourites);

 }

}