import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HoverSharedPreferencesHelper {
  HoverSharedPreferencesHelper._();

  static SharedPreferences? _instance;

  static Future<SharedPreferences> _getInstance() async {
    if (_instance == null) {
      WidgetsFlutterBinding.ensureInitialized();
      _instance = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  static Future<bool> saveSetting(String key, String value) async {
    final sharedPreferences = await _getInstance();
    return sharedPreferences.setString(key, value);
  }

  static Future<String?> loadSetting(String key) async {
    final sharedPreferences = await _getInstance();
    return sharedPreferences.getString(key);
  }
}
