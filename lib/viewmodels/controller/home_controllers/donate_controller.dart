import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unishare/utils/utils.dart';

class DonateController extends GetxController{
  final ImagePicker _picker =ImagePicker();
  RxList<XFile> selectedImages=<XFile>[].obs;
  final RxList<String> imageUrlList=<String>[].obs;
  final titleController=TextEditingController().obs;
  final descriptionController=TextEditingController().obs;
  final titleFocusNode=FocusNode().obs;
  final descriptionFocusNode=FocusNode().obs;
  final categoryFocusNode=FocusNode().obs;

  PickImages()async{
   // PermissionStatus status;
   // DeviceInfoPlugin deviceInfo=DeviceInfoPlugin();
   // AndroidDeviceInfo androidDeviceInfo= await deviceInfo.androidInfo;
   // if(androidDeviceInfo.version.sdkInt<=32){
   //   status=await Permission.storage.request();
   // }
   // else{
   //   status=await Permission.mediaLibrary.request();
   // }
   // if(status==PermissionStatus.granted){
   //
   // }
   // else if(status==PermissionStatus.denied){
   //   Utils.toastMessage("Error\n Please allow permission for further usage");
   // }
   // else if(status==PermissionStatus.permanentlyDenied){
   //   Utils.toastMessage("Error\n Please allow permission for further usage");
   // }

    List<XFile> imgs=[];
    try{
      imgs=await _picker.pickMultiImage(imageQuality: 80,limit: 4);
      if(imgs.isNotEmpty){
        selectedImages.addAll(imgs);
        update();
        print(selectedImages.length);
      }
    }catch(e){
      print(e.toString());
    }
  }

  RemoveImage(int index){
   selectedImages.removeAt(index);
   update();
  }
}