import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required dynamic value}) async {
    if (value == int) {
      await sharedPreferences!.setInt(key, value);
    } else if (value == String) {
      await sharedPreferences!.setString(key, value);
    } else if (value == double) {
      await sharedPreferences!.setDouble(key, value);
    } else if (value == bool) {
      await sharedPreferences!.setBool(key, value);
    } else {}
  }

 static get({required String key}) async {
  return   sharedPreferences!.get(key);
  }

  static remove({required String key}) async {
     await sharedPreferences!.remove(key);
  }

  static clear() async {
    await sharedPreferences!.clear();
  }
}
