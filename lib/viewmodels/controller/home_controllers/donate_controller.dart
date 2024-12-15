
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/model/product_model/product_model.dart';

import 'package:unishare/repositories/home_repository/home_repository.dart';

import 'package:unishare/utils/utils.dart';
import 'package:unishare/viewmodels/controller/home_controllers/home_controller.dart';
import 'package:unishare/viewmodels/services/generate_ids_service.dart';
import 'package:unishare/viewmodels/user_prefrences/user_prefrences.dart';

import '../../../model/user_model/user_model.dart';


class DonateController extends GetxController{
  final homeRepository=HomeRepository();
  var userPreference = UserPrefrences();

  final ImagePicker _picker =ImagePicker();
  RxList<XFile> selectedImages=<XFile>[].obs;
  final RxList<String> imageUrlList=<String>[].obs;

  final titleController=TextEditingController().obs;
  final descriptionController=TextEditingController().obs;
  final priceController=TextEditingController().obs;
  final titleFocusNode=FocusNode().obs;
  final descriptionFocusNode=FocusNode().obs;
  final categoryFocusNode=FocusNode().obs;
  RxString?  selectedCategory=''.obs;
  final loading=false.obs;

  final offerType="Free".obs;

  changeOfferType(String value){
    offerType.value = value;
    update();
  }

  pickImages()async{


    List<XFile> imgs=[];
    try{
      imgs=await _picker.pickMultiImage(imageQuality: 80,limit: 4);
      if(imgs.isNotEmpty){
        selectedImages.addAll(imgs);
        update();
      }
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  removeImage(int index){
   selectedImages.removeAt(index);
   update();
  }

  Future<void> uploadProductImages() async {
    imageUrlList.clear();
    for(int i=0;i<selectedImages.length;i++){
       dynamic imageurl =await homeRepository.uploadProductImage(selectedImages[i]);
       imageUrlList.add(imageurl.toString());
    }
     update();

  }

  Future<void> addProduct(String price)async {
    loading.value=true;
    EasyLoading.show();
    await uploadProductImages().then((value) async {


      UserModel userModel = await userPreference.getUser();

      String id=GenerateIds().generateProductId(selectedCategory!.value);
      ProductModel productModel=ProductModel(
          productId: id,
          title: titleController.value.text,
          description: descriptionController.value.text,
          images: imageUrlList,
          category: selectedCategory!.value,
          price: offerType.value=="Free"? "Free": priceController.value.text,
          createdAt: DateTime.now(),
          providerEmail: userModel.email);
      await homeRepository.uploadProduct(productModel.toMap()).then((value){

        HomeController homeController = Get.find<HomeController>();
        homeController.refreshController();
        EasyLoading.dismiss();
        loading.value=false;
        Get.back();
        Get.back();
        Utils.snackBar("Added", "Product added sucessfully");
      });
    });

  }






}