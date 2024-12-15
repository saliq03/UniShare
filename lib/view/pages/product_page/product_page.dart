
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unishare/model/product_model/product_model.dart';

import 'package:unishare/view/pages/product_page/widgets/bottomnav_button_widget.dart';
import 'package:unishare/view/pages/product_page/widgets/details_widget.dart';
import 'package:unishare/view/pages/product_page/widgets/photos_widget.dart';
import 'package:unishare/view/pages/product_page/widgets/postedby_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/favourites_controller.dart';
import 'package:unishare/viewmodels/controller/home_controllers/productpage_controller.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final controller=Get.put(ProductPageController());
  final favController=Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    final ProductModel product=Get.arguments;
         controller.getOwnerDetails(product.providerEmail);
    return  Scaffold(
        // backgroundColor: Colors.black26,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 35
          ),
          actions: [
            Obx((){
              return IconButton(
                  padding: EdgeInsets.only(right: 15),
                  onPressed: (){
                favController.addOrRemoveFromFavourites(product.productId);
              }, icon: favController.favourites.contains(product.productId)?
              Icon(Icons.favorite_outlined,color: Colors.redAccent,size: 35,):
              Icon(Icons.favorite_outline_sharp,color: Colors.white,size: 35,));
            })

          ],// Removes the shadow

        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhotosWidget(photos: product.images,),
              DetailsWidget(product: product),
              PostedbyWidget(postedOn: DateFormat('yyyy-MM-dd').format(product.createdAt.toDate()),),

              SizedBox(height: 40,)

          
                
            ],
          ),
        ),
      bottomNavigationBar: BottomnavButtonWidget()

    );
  }
}
