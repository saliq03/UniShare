import 'package:get/get.dart';

import '../../res/assets/images_assets.dart';
import '../user_prefrences/user_prefrences.dart';

class BottomNavController extends GetxController{
  final  pageindex=0.obs;
  final photo=ImagesAssets.defaultProfileImage.obs;


  void onInit() {
    super.onInit();
    loadDataFromPref();
  }

  loadDataFromPref() async {
    var userPreference = UserPrefrences(); // Assuming this is where GetUser() is defined
    userPreference.GetUser().then((userModel){
      photo.value=userModel.Photo;
    });
  }

  changePageIndex(int value)=>pageindex.value=value;
}