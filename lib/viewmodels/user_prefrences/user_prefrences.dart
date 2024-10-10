import 'package:shared_preferences/shared_preferences.dart';

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

 Future<Map<String,dynamic>>  GetUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    String? token=sp.getString("token");
    Map<String,dynamic> user={
      "Name": sp.getString("Name"),
      "Email": sp.getString("Email"),
      "Gender": sp.getString("Gender"),
    };
     return user;
  }

  Future<bool> RemoveUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}