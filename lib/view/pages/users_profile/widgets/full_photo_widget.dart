import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullPhotoWidget extends StatelessWidget {
  const FullPhotoWidget({required this.photo,super.key});
   final String photo;
  @override
  Widget build(BuildContext context) {
      return Dialog(
      backgroundColor: Colors.transparent, // Transparent background
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(), // Close dialog on tap
        child: CachedNetworkImage(
            width: double.infinity,
          height: double.infinity,
            fit: BoxFit.contain,
            imageUrl: photo,
            placeholder: (context,url)=>const Center(child: CircularProgressIndicator(color: Colors.white,)),),
      ),
    );
  }
}
