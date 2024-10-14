import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unishare/model/user_model/user_model.dart';

class LoginRepository{
  Future<UserModel> fetchUser(String email) async{
    final snapshot=await FirebaseFirestore.instance.collection("Users")
        .where("Email",isEqualTo: email).get();
    final userData=snapshot.docs.map((e)=>UserModel.fromSnapshot(e)).single;
    return userData;
}
}