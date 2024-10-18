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
}