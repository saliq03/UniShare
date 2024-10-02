import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices{
   uploadData(String collection,String docId, Map<String,dynamic> data) async {
     print("in upload data");
     try{
       await FirebaseFirestore.instance.
       collection(collection).
       doc(docId).
       set(data);
     }
     catch(e){
       print("error in upload data");
       print(e);
     }
   }
}