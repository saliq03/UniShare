import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
 }

}