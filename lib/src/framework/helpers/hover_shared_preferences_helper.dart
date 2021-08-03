import 'package:shared_preferences/shared_preferences.dart';

class HoverSharedPreferencesHelper {
  HoverSharedPreferencesHelper._();

  static late SharedPreferences _instance;

  static Future<SharedPreferences> getInstance() async {
    _instance = await SharedPreferences.getInstance();
    return _instance;
  }

  static Future<bool> saveSetting(String key, String value) async {
    final sharedPreferences = await getInstance();
    return sharedPreferences.setString(key, value);
  }

  static Future<String?> loadSetting(String key) async {
    final sharedPreferences = await getInstance();
    return sharedPreferences.getString(key);
  }
}
