import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../viewmodels/controller/home_controllers/chat_screen_controller.dart';

class ShowImageSource{
  final csController=Get.put(ChatScreenController());

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
                csController.pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                csController.pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

