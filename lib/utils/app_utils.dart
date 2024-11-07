import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static Future<void> setUserInfo(String name, String date) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("username", name);
    pref.setString("birthday", date);
  }

  static Future<String> getUserName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("name") ?? "";
  }

  static Future<String> getUserBirthdate() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("birthday") ?? "";
  }

  static Future<void> onLogout() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isLogged", false);
  }

  static Future<void> onDeleteAccount() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  static Future<bool> getLoggedStatus() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("isLogged") ?? false;
  }

  static Future<Map> getRegisteredCredentials() async {
    final pref = await SharedPreferences.getInstance();
    return {
      "email": pref.getString("email"),
      "password": pref.getString("password"),
    };
  }
}
