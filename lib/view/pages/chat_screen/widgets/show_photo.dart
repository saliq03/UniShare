import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowPhoto extends StatelessWidget {
  const ShowPhoto({required this.photo,super.key});
   final String photo;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent, // Transparent background
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(), // Close dialog on tap
          child:
              ClipRRect(
                borderRadius: BorderRadius.circular(160),
                child: CachedNetworkImage(
                  width: 320,height: 320,
                    fit: BoxFit.cover,
                    imageUrl: photo,
                 placeholder: (context,url)=>const Center(child: CircularProgressIndicator(color: Colors.white,)),),
              ),
        ),
      );
  }
}
