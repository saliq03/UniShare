import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/chat_services/chat_services.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../repositories/login_repository/login_repository.dart';

class AllChatsPageController extends GetxController{
 final chatServices=ChatServices();

  Stream<List<UserModel>> getChats(String currentUserId) {
    return chatServices.getAllchats(currentUserId).asyncMap((idList) async {
      final userList = await Future.wait(idList.map((id) async {
        String otherUserId = id.replaceFirst(currentUserId, "").replaceAll("_", '');
        return await LoginRepository().fetchUser(otherUserId);
      }));
      return userList;
    });

  }



}