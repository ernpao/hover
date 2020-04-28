import 'package:shared_preferences/shared_preferences.dart';

class HoverSharedPreferencesHelper {
  static SharedPreferences _instance;

  static Future<SharedPreferences> getInstance() async {
    if (_instance == null) {
      _instance = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  static void saveSetting(String key, String value) async {
    final sharedPreferences = await getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<String> loadSetting(String key) async {
    final sharedPreferences = await getInstance();
    return sharedPreferences.getString(key);
  }
}
