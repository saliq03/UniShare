import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:unishare/viewmodels/controller/profile_controller.dart';

class GenerateIds{
  final profileController=Get.put(ProfileController());

  generateProductImageId(){
    String id=randomAlphaNumeric(10);
    return "UniShare-product-$id";
  }
  generateProductId(String category){
    String id=randomAlphaNumeric(5);
    return "UniShare-$category-$id";
  }
  generateMessageId(String sender,String reciever){
    String id =randomAlphaNumeric(7);
    return '$sender-$reciever-$id';
  }
  generateMessageImageId(){
    String id=randomAlphaNumeric(10);
    return "Chat-$id";
  }
  generateCallId(String sender,String reciever){
    String id =randomAlphaNumeric(7);
    return '$sender-$reciever-$id';
  }
  generateRoomId(String targetId){
    List<String> ids=[profileController.currentUser.value!.email,targetId];
    ids.sort();
    String chatRoomId=ids.join('_');
    return chatRoomId;
  }
}