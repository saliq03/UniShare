import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';

import '../user_prefrences/user_prefrences.dart';

class ProfileController extends GetxController{
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    update();
  }

  getCurrentUser() async {
    currentUser.value=await UserPrefrences().GetUser();
  }
}