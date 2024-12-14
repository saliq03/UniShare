import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:unishare/viewmodels/controller/home_controllers/edit_profile_controller.dart';

import '../../../../res/colors/app_colors.dart';

class PhotoNameWidget extends StatelessWidget {
   PhotoNameWidget({required this.initImage,super.key});
   final String initImage;

  final epController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            showImageSourceDialog(context);
          },
          child: Stack(
            children: [
              Obx((){
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.grey
                  ),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: epController.selectedImage.value==null?
                    CachedNetworkImage(fit: BoxFit.cover,
                      width: 120,height: 120,
                      imageUrl: initImage,
                    placeholder: (context,url)=>const Center(child: CircularProgressIndicator()),):
                        Image.file(epController.selectedImage.value!,fit: BoxFit.cover,),
                  )
                );
              }),
              const Positioned(bottom: 15,right: 25,
                  child: Icon(Icons.add_a_photo_outlined,color: Colors.white,))
            ],
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: TextFormField(
            controller: epController.nameController.value,
            decoration: const InputDecoration(
                labelText: "Enter your name",
                labelStyle: TextStyle(color:AppColors.loginGradient2 )),
          ),
        )
      ],
    );
  }

   void showImageSourceDialog(BuildContext context) {
     showModalBottomSheet(
       elevation: 5,
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(top: Radius.circular(20))
       ),
       context: context,
       builder: (_) {
         return Wrap(
           children: [
             ListTile(
               leading: const Icon(Icons.photo_library),
               title: const Text("Gallery"),
               onTap: () {
                 epController.PickImage(ImageSource.gallery);
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: const Icon(Icons.camera_alt),
               title: const Text("Camera"),
               onTap: () {
                 epController.PickImage(ImageSource.camera);
                 Navigator.pop(context);
               },
             ),
           ],
         );
       },
     );
   }
}
