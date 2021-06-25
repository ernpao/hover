import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HoverThemeData extends ChangeNotifier {
  final Map<String, ThemeData> themes;
  late ThemeData _currentTheme;
  ThemeData get currentTheme => _currentTheme;
  ThemeData get initialTheme => themes.values.elementAt(0);

  HoverThemeData({
    required this.themes,
  }) {
    _currentTheme = themes[themes.keys.elementAt(0)]!;
  }

  void setThemeByName(String themeName) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('theme', themeName);
    if (themes[themeName] != null) {
      _currentTheme = themes[themeName]!;
      notifyListeners();
    } else {
      print('Theme "$themeName" not found.');
    }
  }

  Future<String?> getCurrentThemeName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('theme');
  }

  /// Load the saved theme. If no saved theme is found Hover will use the first theme available and save the setting.
  void loadSavedTheme() {
    getCurrentThemeName().then((name) {
      if (name == null) {
        setThemeByName(themes.keys.elementAt(0));
      } else {
        setThemeByName(name);
      }
    });
  }
}

class HoverThemeProvider extends ChangeNotifierProvider<HoverThemeData> {
  HoverThemeProvider(HoverThemeData theme) : super(create: (_) => theme);
}
