import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/repositories/auth_repository.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/view/side_bar/widgets/user_accounts_header_widget.dart';
import '../../viewmodels/controller/home_controllers/sidebar_controller.dart';

class SideBar extends StatelessWidget {
   SideBar({super.key});
  final sidebarController=Get.put(SidebarController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        children: [
         const UserAccountsHeaderWidget(),
          
          ListTile(
            leading:const Icon(Icons.favorite,),
            title: const Text("Favorites",style: TextStyle(fontSize: 18),),
            onTap: (){
              Get.back();
              Get.toNamed(RoutesName.favouritesPage);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text("My Ads",style: TextStyle(fontSize: 18,),),
            onTap: (){
              Get.back();
              Get.toNamed(RoutesName.myAdsPage);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Edit Profile",style: TextStyle(fontSize: 18),),
            onTap: (){
              Get.back();
              Get.toNamed(RoutesName.editProfilePage,arguments: sidebarController.Photo.value);
            },
          ),

          // ListTile(
          //   leading: Icon(Icons.notifications),
          //   title: Text("Request"),
          //   trailing: ClipOval(
          //     child: Container(
          //       color: Colors.red,
          //       width: 20,
          //       height: 20,
          //       child: Center(child: Text("8",style: TextStyle(color: Colors.white,fontSize: 12),)),
          //     ),
          //   ),
          //   onTap: ()=>null,
          // ),

          const SizedBox(height: 30,),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: (){Navigator.pop(context);
              AuthRepository().logout();
              sidebarController.logOut();
              },
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
