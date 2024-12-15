import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/res/components/my_text_button.dart';
import 'package:unishare/view/pages/donate_page/widgets/upload_image_widget.dart';
import 'package:unishare/viewmodels/controller/home_controllers/donate_controller.dart';

class ShowImagesWidget extends StatelessWidget {
  const ShowImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DonateController>(
        init: DonateController(),
        builder: (imagecontroller){
      return imagecontroller.selectedImages.isNotEmpty ?
          Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 250,
                ),
                child: GridView.builder(
                  itemCount: imagecontroller.selectedImages.length,
                    shrinkWrap: true,
                    physics:const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 150),
                    itemBuilder: (BuildContext context,int index){
                    return Stack(
                      children: [
                        Image.file(
                          File(imagecontroller.selectedImages[index].path),
                          fit: BoxFit.cover,
                          height: 150,
                          width: Get.width/2,
                        ),
                        Positioned(
                            top: 3,
                            right: 3,
                            child: InkWell(
                              onTap:() {
                                imagecontroller.RemoveImage(index);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                 radius: 15,
                                child: Icon(Icons.close,color: Colors.white,size: 20,),
                              ),
                            ))
                      ],
                    );
                    }),
              ),
              SizedBox(height: 5,),
              MyTextButton(title: "Click to add more", onPress: (){
                imagecontroller.PickImages();
              })
            ],
          )
          : UploadImageWidget();
    });
  }
}
