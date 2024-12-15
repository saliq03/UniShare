import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String name;
  final String email;
  final String gender;
  final String photo;
  final String bio;
  final String status;


  UserModel( {
    required  this.photo,
    required this.bio,
    required this.name,
    required this.email,
    required this.gender,
    required this.status});

  toJson(){
    return {"Name":name, "Email":email, "Gender":gender, "Status":status};
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data=document.data()!;
    return UserModel(
        name: data["Name"],
        email: data["Email"],
        gender: data["Gender"],
        bio: data["Bio"],
        photo: data["Photo"],
        status:  data["Status"]
    );
  }

}