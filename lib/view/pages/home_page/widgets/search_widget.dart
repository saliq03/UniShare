import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../../viewmodels/controller/home_controllers/home_controller.dart';

class SearchWidget extends StatelessWidget {
   SearchWidget({super.key});


  final homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: homeController.searchController.value,
      focusNode: homeController.searchFocusNode.value,
      onChanged: (value){
        homeController.onSearchTextChanged(value);
      },
      decoration: InputDecoration(
          suffixIcon:Obx((){
            if(homeController.searchText==""){
              return const SizedBox.shrink();
            }
            else{
              return  IconButton(onPressed: (){
                homeController.searchController.value.clear();
                homeController.onSearchTextChanged('');
                homeController.searchFocusNode.value.unfocus();
              }, icon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey.shade700,));
            }
           }),

          prefixIcon: Icon(Icons.search,size: 30,),
          hintText: "Find Books, Buckets and More..",
          hintStyle: TextStyle(color: Colors.black54,fontSize: 18
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2))
      ),
    );
  }
}
