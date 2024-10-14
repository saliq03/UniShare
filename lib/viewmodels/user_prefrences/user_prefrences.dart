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

  Future<bool> SaveUser(String name, String email, String gender) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("Name", name);
    sp.setString("Email", email);
    sp.setString("Gender", gender);
    return true;
  }

 Future<UserModel>  GetUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();

    final user=UserModel(Name: sp.getString("Name")?? 'No Name', Email: sp.getString("Email")?? 'No Email', Gender: sp.getString("Gender")?? 'Unknown');

     return user;
  }

  Future<bool> RemoveUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}