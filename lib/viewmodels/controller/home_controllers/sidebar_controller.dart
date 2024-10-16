import 'package:get/get.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../model/user_model/user_model.dart';
import '../../../res/routes/routes_name.dart';

class SidebarController extends GetxController{
  final Name= ''.obs;
  final Email=''.obs;


  @override
  void onInit() {

    super.onInit();
    LoadDataFromPrefrences();

  }

  LoadDataFromPrefrences()async{
    var userPreference = UserPrefrences(); // Assuming this is where GetUser() is defined
    UserModel userModel = await userPreference.GetUser();
    Name.value=userModel.Name;
    Email.value=userModel.Email;
  }

  logOut(){
    UserPrefrences().RemoveUser();
    Get.offNamed(RoutesName.loginview);
  }


}