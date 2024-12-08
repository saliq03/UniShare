import 'package:random_string/random_string.dart';

class GenerateIds{
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
}