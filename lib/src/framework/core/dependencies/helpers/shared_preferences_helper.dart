import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> getInstance() async => SharedPreferences.getInstance();
}
