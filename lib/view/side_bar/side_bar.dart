import 'package:flutter/material.dart';
import 'package:unishare/res/assets/icons_assets.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      shape: OutlineInputBorder(
        borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.circular(0)),

      
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
         UserAccountsDrawerHeader(
             accountName: Text("Saliq javeed"),
             accountEmail: Text("javidsaliq@gmail.com"),
           currentAccountPicture: CircleAvatar(
             child: ClipOval(
               child: Image.asset(IconsAssets.tickedCircle
               ,width: 90,height: 90,
               fit: BoxFit.cover,),)),
           decoration: BoxDecoration(
             color: Colors.blue,
             image: DecorationImage(
                 image: NetworkImage("https://img.freepik.com/free-photo/abstract-dark-blurred-background-smooth-gradient-texture-color-shiny-bright-website-pattern-banner-header-sidebar-graphic-art-image_1258-85447.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1727740800&semt=ais_hybrid"),
               fit: BoxFit.cover
           ),
         )),
          
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
