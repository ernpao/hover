import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> getInstance() async => SharedPreferences.getInstance();

  static void saveSetting(String key, String value) async {
    final sharedPreferences = await getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<String> loadSetting(String key) async {
    final sharedPreferences = await getInstance();
    return sharedPreferences.getString(key);
  }
}
