import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import '../../viewmodels/services/generate_ids_service.dart';

class HomeRepository{
  FirebaseStorage storage=FirebaseStorage.instanceFor(bucket: dotenv.env['BUCKET']!);

  Future<String> UploadProductImage(XFile image) async {
    String id = GenerateIds().GenerateProductImageId();

    TaskSnapshot snapshot=await storage.
    ref("Product_images").
    child(id).
    putFile(File(image.path));

    return await snapshot.ref.getDownloadURL();

  }

  Future<void> UploadProduct(Map<String,dynamic> product)async {
    try{
      await FirebaseFirestore.instance.
      collection("Products").
      doc(product["ProductId"]).
      set(product);
    } catch(e){
      print(e.toString());
    }

  }
}