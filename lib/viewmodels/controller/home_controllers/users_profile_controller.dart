import 'package:get/get.dart';
import 'package:unishare/repositories/users_profile_repository/users_profile_repository.dart';

import '../../../model/product_model/product_model.dart';

class UsersProfileController extends GetxController{
  final usersPageRepo=UsersProfileRepository();

  RxList<ProductModel> usersProducts=<ProductModel>[].obs;
  final loading=false.obs;

  final String email;
  UsersProfileController({required this.email});

  @override
  void onInit(){
    super.onInit();
    loading.value=true;
    getUsersProducts().then((value){
      loading.value=false;
    });
  }

  getUsersProducts() async {
  usersProducts.value= await usersPageRepo.fetchUsersProducts(email);
    update();
  }
}