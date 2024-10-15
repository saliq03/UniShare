import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unishare/view/pages/donate_page/widgets/upload_image_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/donate_controller.dart';

class ShowImagesWidget extends StatelessWidget {
  const ShowImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DonateController>(
        init: DonateController(),
        builder: (imagecontroller){
      return imagecontroller.selectedImages.length>0? Text("Images")
          : UploadImageWidget();
    });
  }
}
