import 'package:get/get.dart';
import 'package:unishare/model/product_model/product_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/repositories/home_repository/home_repository.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

class HomeController extends GetxController{
  final homeRepository=HomeRepository();

   RxList<ProductModel> products=<ProductModel>[].obs;


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
    print("getProducts method called");
    UserModel currUser=await UserPrefrences().GetUser();
     try{
       List<ProductModel> fetchedProducts = await homeRepository.getAllProducts(currUser.Email);
       products.assignAll(fetchedProducts);
       update();
     }catch(e){
       print(e.toString());
     }
   }

}