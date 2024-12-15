import 'package:shared_preferences/shared_preferences.dart';
import 'package:unishare/model/user_model/user_model.dart';

class UserPrefrences {
  setLoginKey(bool value) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setBool('islogin', value);
  }
  Future<bool?> getLoginKey() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    return sp.getBool('islogin');
  }

  Future<bool> saveUser(UserModel user) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("Name", user.name);
    sp.setString("Email", user.email);
    sp.setString("Gender", user.gender);
    sp.setString("Photo", user.photo);
    sp.setString("Bio", user.bio);
    return true;
  }

 Future<UserModel>  getUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();

    final user=UserModel(name: sp.getString("Name")?? 'No Name', email: sp.getString("Email")?? 'No Email', gender: sp.getString("Gender")?? 'Unknown',bio: sp.getString("Bio")?? '',photo: sp.getString("Photo")?? 'error',status: sp.getString("Status")??'online');

     return user;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}