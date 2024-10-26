import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String Name;
  final String Email;
  final String Gender;
  final String Photo;
  final String Bio;

  UserModel( {
    required  this.Photo,
    required this.Bio,
    required this.Name,
    required this.Email,
    required this.Gender});

  toJson(){
    return {"Name":Name, "Email":Email, "Gender":Gender};
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data=document.data()!;
    return UserModel(
        Name: data["Name"],
        Email: data["Email"],
        Gender: data["Gender"],
        Bio: data["Bio"],
        Photo: data["Photo"]
    );
  }

}