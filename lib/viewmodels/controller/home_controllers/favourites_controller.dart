import 'package:get/get.dart';
import 'package:unishare/repositories/favourites_repository/favourites_repository.dart';

class FavouritesController extends GetxController{
 var favourites=<String>[].obs;
 final favouritesRepository=FavouritesRepository();
 @override
 void onInit(){
  super.onInit();
  getFavourites();
 }

 getFavourites()async{
  favourites = await favouritesRepository.GetFavourites();
  update();
 }

 removeFromFavourites(String id){
  favourites.remove(id);
  favouritesRepository.RemoveFromFavourites(id);
  update();
 }

 addToFavourites(String id){
  favourites.add(id);
  favouritesRepository.AddToFavourites(id);
  update();
 }

}