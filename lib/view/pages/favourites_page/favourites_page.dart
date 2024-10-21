import 'package:flutter/material.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/view/pages/favourites_page/widgets/details_row.dart';
import 'package:unishare/view/pages/favourites_page/widgets/fav_icon_widget.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAVOURITES",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.loginGradient2),),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
          width:  double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: 10,
             physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
              return Column(
                children: [
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [
                     DetailsRow(),
                      FavIconWidget()
                    ],
                  ),
                  Divider()
                ],
              );
            }),
        ),
    );
  }
}
