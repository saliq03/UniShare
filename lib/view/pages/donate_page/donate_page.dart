import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/res/components/rectangle_button.dart';
import 'package:unishare/res/routes/routes_name.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/view/pages/donate_page/free_or_paid_screen.dart';
import 'package:unishare/view/pages/donate_page/widgets/description_input_widget.dart';
import 'package:unishare/view/pages/donate_page/widgets/select_category_widget.dart';
import 'package:unishare/view/pages/donate_page/widgets/show_images_widget.dart';
import 'package:unishare/view/pages/donate_page/widgets/title_input_widget.dart';

import '../../../viewmodels/controller/home_controllers/donate_controller.dart';


class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final donateController=Get.put(DonateController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add product deatails"),
        centerTitle: true,
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),

          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaQuery.of(context).viewInsets.bottom > 0? SizedBox(height: 10,):
                ShowImagesWidget(),
                const SizedBox(height: 20),
                 TitleInputWidget(),
                SizedBox(height: 16),
                DescriptionInputWidget(),
                const SizedBox(height: 16),
                SelectCategoryWidget(),
                Spacer(),
                RectangleButton(title: "Next", onPress: (){
                  if(_formKey.currentState!.validate()){
                    if(donateController.selectedImages.length>0){
                        Get.toNamed(RoutesName.freeOrPaidPage);
                    }
                    else{
                      Utils.toastMessage("No image added");
                    }
                  }

                }, buttonColor: Colors.purpleAccent.shade100,),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
