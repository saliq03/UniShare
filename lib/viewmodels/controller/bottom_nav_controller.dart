import 'package:get/get.dart';

import '../../res/assets/images_assets.dart';
import '../user_prefrences/user_prefrences.dart';

class BottomNavController extends GetxController{
  final  pageindex=0.obs;
  final photo=ImagesAssets.defaultProfileImage.obs;


  @override
  void onInit() {
    super.onInit();
    loadDataFromPref();
  }
  refreshController(){
    loadDataFromPref();
    update();
  }

  loadDataFromPref() async {
    var userPreference = UserPrefrences(); // Assuming this is where GetUser() is defined
    userPreference.getUser().then((userModel){
      photo.value=userModel.photo;
    });
  }

  changePageIndex(int value)=>pageindex.value=value;
}