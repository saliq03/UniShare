import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/res/colors/app_colors.dart';
import 'package:unishare/res/components/customized_back_button.dart';
import 'package:unishare/res/components/round_button.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/view/pages/edit_product_page/widgets/description_widget.dart';
import 'package:unishare/view/pages/edit_product_page/widgets/product_image_widget.dart';
import 'package:unishare/view/pages/edit_product_page/widgets/title_price_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/edit_product_controller.dart';

import '../../../model/product_model/product_model.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {

  final editProductController=Get.put(EditProductController());
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    editProductController.initializeControllers(Get.arguments);
  }
  @override
  Widget build(BuildContext context) {
    final ProductModel product=Get.arguments;
    return Scaffold(
      appBar:  AppBar(
        title:Text(" Edit info",style: Theme.of(context).textTheme.headlineMedium,),
        centerTitle: true,
        leading: CustomizedBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RoundButton(title: "Save", onPress: (){
              if(_formKey.currentState!.validate()){
                editProductController.updateProduct(product).then((value){
                  Get.back();
                  Utils.snackBar("Product updated", "The product info has been updated sucessfully");
                });
              }

            },
            buttonColor: AppColors.loginGradient2,titleColor: AppColors.white,
            width: 80,height: 40,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              ProductImageWidget(images: product.images,),
              SizedBox(height: 20,),
              TitlePriceWidget(),

              SizedBox(height: 16),
              Text("Description:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              DescriptionWidget()
            ],
          ),
        ),
      ),
    );
  }
}
