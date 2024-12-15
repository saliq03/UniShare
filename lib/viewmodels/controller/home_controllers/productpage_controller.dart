
import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/repositories/login_repository/login_repository.dart';
import 'package:unishare/res/routes/routes_name.dart';

class ProductPageController extends GetxController{
  final activeIndex=0.obs;
  Rx<UserModel?> owner=Rx<UserModel?>(null);
  getOwnerDetails(String email)async{
   UserModel fetchedUser = await LoginRepository().fetchUser(email);
   owner.value=fetchedUser;
  }

  chat(){
    Get.toNamed(RoutesName.chatScreen,arguments: owner.value);
  }
  seeProfile(){
    Get.toNamed(RoutesName.usersProfile,arguments: owner.value);
  }

}