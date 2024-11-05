import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unishare/services/firebase_services/firebase_services.dart';

import '../../model/product_model/product_model.dart';
import '../../viewmodels/services/generate_ids_service.dart';

class HomeRepository {
  final firebaseServices=FirebaseServices();
  FirebaseStorage storage = FirebaseStorage.instanceFor(
      bucket: dotenv.env['BUCKET']!);

  Future<String> UploadProductImage(XFile image) async {
    String id = GenerateIds().GenerateProductImageId();
    try{
      return await firebaseServices.uploadImage("Product_images", id, image);
    }catch(e){
      print(e.toString());
      throw e;
    }

  }

  Future<void> UploadProduct(Map<String, dynamic> product) async {
    try {
      firebaseServices.uploadData("Products", product["ProductId"], product);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ProductModel>> getAllProducts(String email) async {
    try{
      // where("ProviderEmail", isNotEqualTo: email)
      final snapshot = await FirebaseFirestore.instance
          .collection("Products")
          .where("ProviderEmail", isNotEqualTo: email)
          .orderBy("ProviderEmail") // Required for inequality filter
          .orderBy("CreatedAt", descending: true)
          .get();
      final List<ProductModel> products = snapshot.docs.map((e) {
        return ProductModel.fromMap(e.data() as Map<String, dynamic>);
      }).toList();

      return products;
    } catch(e){
      print(e.toString());
      throw e;
    }

  }
}