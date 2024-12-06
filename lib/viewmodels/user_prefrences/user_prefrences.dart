import 'package:shared_preferences/shared_preferences.dart';
import 'package:unishare/model/user_model/user_model.dart';

class UserPrefrences {
  SetLoginKey(bool value) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setBool('islogin', value);
  }
  Future<bool?> GetLoginKey() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    return sp.getBool('islogin');
  }

  Future<bool> SaveUser(UserModel user) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("Name", user.Name);
    sp.setString("Email", user.Email);
    sp.setString("Gender", user.Gender);
    sp.setString("Photo", user.Photo);
    sp.setString("Bio", user.Bio);
    return true;
  }

 Future<UserModel>  GetUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();

    final user=UserModel(Name: sp.getString("Name")?? 'No Name', Email: sp.getString("Email")?? 'No Email', Gender: sp.getString("Gender")?? 'Unknown',Bio: sp.getString("Bio")?? '',Photo: sp.getString("Photo")?? 'error',Status: sp.getString("Status")??'online');

     return user;
  }

  Future<bool> RemoveUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}