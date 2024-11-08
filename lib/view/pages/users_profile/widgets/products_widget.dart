import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:unishare/view/pages/users_profile/widgets/products_shimmer_widget.dart';
import 'package:unishare/view/pages/users_profile/widgets/show_product_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/users_profile_controller.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({required this.controller,super.key});
 final UsersProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return
        controller.loading.value?
        const ProductsShimmerWidget():
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.usersProducts.length,
            itemBuilder: (context,index){
              return ProductWidget(product: controller.usersProducts[index],);
            });
    });
  }
}
