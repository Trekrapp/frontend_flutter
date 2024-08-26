import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<void> saveToken(String token) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("accessToken", token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("accessToken");
  }

  static Future<String?> removeToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("accessToken");
  }

  static Future<void> saveName(String name) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("name", name);
  }

  static Future<String?> getName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("name");
  }

  static Future<void> saveProfileImage(String imageProfile) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("imageProfile", imageProfile);
  }

  static Future<String?> getProfileImage() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("imageProfile");
  }
}
