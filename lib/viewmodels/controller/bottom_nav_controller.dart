import 'package:get/get.dart';

class BottomNavController extends GetxController{
  final  pageindex=0.obs;

  changePageIndex(int value)=>pageindex.value=value;
}