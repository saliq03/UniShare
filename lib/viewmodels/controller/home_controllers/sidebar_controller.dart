import 'package:get/get.dart';
import 'package:unishare/res/assets/images_assets.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../res/routes/routes_name.dart';

class SidebarController extends GetxController{
  final Name= ''.obs;
  final Email=''.obs;
  final Photo=ImagesAssets.defaultProfileImage.obs;



  @override
  void onInit() {
    super.onInit();
    LoadDataFromPrefrences();
  }

  refreshController(){
    print("refresh controller called");
    LoadDataFromPrefrences();
  }

  LoadDataFromPrefrences()async{
    print("in load prefrences");
    var userPreference = UserPrefrences(); // Assuming this is where GetUser() is defined
    userPreference.GetUser().then((userModel){
      print(userModel.Name);
      Name.value=userModel.Name;
      Email.value=userModel.Email;
      Photo.value=userModel.Photo;
    });

  }

  logOut(){
    UserPrefrences().RemoveUser();
    Get.offNamed(RoutesName.loginview);
  }


}