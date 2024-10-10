import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';
import 'package:unishare/view/side_bar/widgets/user_accounts_header_widget.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
            title: Text("Exit"),
            onTap: (){Navigator.pop(context);},
          ),
        ],
      ),
    );
  }
}
