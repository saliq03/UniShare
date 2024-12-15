import 'package:get/get.dart';
import 'package:unishare/res/assets/images_assets.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../res/routes/routes_name.dart';

class SidebarController extends GetxController{
  final name= ''.obs;
  final Email=''.obs;
  final Photo=ImagesAssets.defaultProfileImage.obs;



  @override
  void onInit() {
    super.onInit();
    loadDataFromPrefrences();
  }

  refreshController(){
    loadDataFromPrefrences();
  }

  loadDataFromPrefrences()async{
    var userPreference = UserPrefrences(); // Assuming this is where GetUser() is defined
    userPreference.getUser().then((userModel){
      name.value=userModel.name;
      Email.value=userModel.email;
      Photo.value=userModel.photo;
    });

  }

  logOut(){
    UserPrefrences().removeUser();
    Get.offNamed(RoutesName.loginview);
  }


}