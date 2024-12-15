import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/utils/utils.dart';

import '../../../../viewmodels/controller/home_controllers/edit_product_controller.dart';

class ProductImageWidget extends StatefulWidget {
  final List images;
  const ProductImageWidget({required this.images, super.key});

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {

  final editProductController=Get.put(EditProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      // width: double.infinity,
      height: 210,
      color: Colors.black54,
      child: CarouselSlider.builder(
        itemCount: widget.images.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Stack(
            children: [
              Hero(
                tag: widget.images[0],
                child: CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  imageUrl: widget.images[index],
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: InkWell(
                  child: const Icon(Icons.delete, color: Colors.grey, size: 30),
                  onTap: () {
                    if(widget.images.length>1){
                      editProductController.images.add(widget.images[index]);
                      setState(() {
                        widget.images.removeAt(index); // Remove image
                      });
                    }
                    else{
                      Utils.toastMessage("Single image can't delete");
                    }

                  },
                ),
              ),
            ],
          );
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.4,
          enlargeCenterPage: true,
          viewportFraction: 1,
          // autoPlay: true, // Uncomment to enable autoPlay if needed
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          onPageChanged: (index, reason) {
            // You can handle page changes here if needed
          },
        ),
      ),
    );
  }
}
