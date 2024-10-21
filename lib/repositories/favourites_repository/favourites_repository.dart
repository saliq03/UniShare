import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

class FavouritesRepository{

  AddToFavourites(String productId) async {
    UserModel user=await UserPrefrences().GetUser();
    try{
      await FirebaseFirestore.instance.
      collection("Users").
      doc(user.Email).
      collection("Favourites").
      doc(productId).set({
        "ProductId": productId,
      });
    }catch(e){
      print(e.toString());
    }


  }

  RemoveFromFavourites(String productId) async {
    UserModel user=await UserPrefrences().GetUser();
    try{
      await FirebaseFirestore.instance.
      collection("Users").
      doc(user.Email).
      collection("Favourites").
      doc(productId).delete();
    } catch(e){
      print(e.toString());
    }
  }

 Future<List<String>> GetFavourites() async {
    UserModel user=await UserPrefrences().GetUser();
  try{
    final snapshot = await FirebaseFirestore.instance.
    collection("Users").
    doc(user.Email).
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

  FetchFavouriteProducts(List<String> ids){

  }
}