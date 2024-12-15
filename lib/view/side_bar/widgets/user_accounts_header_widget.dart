import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unishare/res/assets/images_assets.dart';
import 'package:unishare/viewmodels/controller/home_controllers/sidebar_controller.dart';



class UserAccountsHeaderWidget extends StatelessWidget {
   const UserAccountsHeaderWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SidebarController>( // Wrap with GetBuilder
      builder: (controller) {
        return UserAccountsDrawerHeader(
          accountName: Obx(() => Text(controller.name.value)),
          accountEmail: Obx(() => Text(controller.Email.value)),
          currentAccountPicture: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: controller.Photo.value,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage(ImagesAssets.sideBarBg),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
