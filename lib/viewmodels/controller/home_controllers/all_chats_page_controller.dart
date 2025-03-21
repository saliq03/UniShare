import 'package:get/get.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/chat_services/chat_services.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../repositories/login_repository/login_repository.dart';

class AllChatsPageController extends GetxController {
  final chatServices = ChatServices();


  Stream<List<Map<String,dynamic>>> getChats() async* {
    String currentUserId = await getCurrentUser();


  try{
    print("in the try block");


    yield* chatServices.getAllchats(currentUserId).asyncMap((chats) async {
      print("userList length");
      final userList = await Future.wait(chats.map((chat) async {
        String otherUserId = chat.id.replaceFirst(currentUserId, "").replaceAll("_", '');

        return { "User" :await LoginRepository().fetchUser(otherUserId),
          "Chat": chat};
      }));

      print(userList.length);
      return userList;
    });

  }
  catch(e){
    print("an error occured");
    print(e.toString());
  }
  }

  Future<String> getCurrentUser() async {
    UserModel currUser = await UserPrefrences().getUser();
    return currUser.email;
  }
}


