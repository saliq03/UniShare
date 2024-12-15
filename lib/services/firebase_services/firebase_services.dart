import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseServices{
  FirebaseStorage storage = FirebaseStorage.instanceFor(
      bucket: dotenv.env['BUCKET']!);

  Future<void> uploadData(String collection,String docId, Map<String,dynamic> data) async {

     try{
       await FirebaseFirestore.instance.
       collection(collection).
       doc(docId).
       set(data);
     }
     catch(e){
       if (kDebugMode) {
         print(e);
       }
     }
   }

  Future<void> updateData(String collection,String docId,Map<String,dynamic> data) async {
     try{
       await FirebaseFirestore.instance.collection(collection).doc(docId).
       update(data);
     }
     catch (e){
       if (kDebugMode) {
         print(e.toString());
       }
     }

   }

   Future<void> deleteData(String collection,String id) async {
     try{
      await FirebaseFirestore.instance
           .collection(collection) // Replace with your actual collection
           .doc(id)
           .delete();
     } catch(e){
       if (kDebugMode) {
         print(e.toString());
       }
     }
   }

   Future<String>uploadImage(String ref,String id,XFile image) async {

     TaskSnapshot snapshot = await storage.
     ref(ref).
     child(id).
     putFile(File(image.path));
     return await snapshot.ref.getDownloadURL();
   }

  Future<void> deleteImage(String imageUrl)async {
    try {
      final Reference storageRef = FirebaseStorage.instance.refFromURL(imageUrl);
      await storageRef.delete();
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}