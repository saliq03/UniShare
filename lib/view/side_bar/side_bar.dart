import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/view/side_bar/widgets/user_accounts_header_widget.dart';
import '../../viewmodels/controller/home_controllers/sidebar_controller.dart';

class SideBar extends StatelessWidget {
   SideBar({super.key});
  final sidebarController=Get.put(SidebarController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
         UserAccountsHeaderWidget(),
          
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favourites"),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Request"),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(child: Text("8",style: TextStyle(color: Colors.white,fontSize: 12),)),
              ),
            ),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting"),
            onTap: ()=>null,
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: (){Navigator.pop(context);
              sidebarController.logOut();
              },
          ),
        ],
      ),
    );
  }
}
