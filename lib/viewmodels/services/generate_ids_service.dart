import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:random_string/random_string.dart';
import 'package:unishare/viewmodels/controller/profile_controller.dart';

class GenerateIds{
  final profileController=Get.put(ProfileController());

  GenerateProductImageId(){
    String id=randomAlphaNumeric(10);
    return "UniShare-product-${id}";
  }
  GenerateProductId(String category){
    String id=randomAlphaNumeric(5);
    return "UniShare-$category-$id";
  }
  GeneratMessageId(String sender,String reciever){
    String id =randomAlphaNumeric(7);
    return '$sender-$reciever-$id';
  }
  GenerateMessageImageId(){
    String id=randomAlphaNumeric(10);
    return "Chat-${id}";
  }
  GenerateCallId(String sender,String reciever){
    String id =randomAlphaNumeric(7);
    return '$sender-$reciever-$id';
  }
  GenerateRoomId(String targetId){
    List<String> ids=[profileController.currentUser.value!.Email,targetId];
    ids.sort();
    String chatRoomId=ids.join('_');
  }
}