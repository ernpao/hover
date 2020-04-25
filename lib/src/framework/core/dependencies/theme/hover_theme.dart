import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HoverThemeData extends ChangeNotifier {
  final Map<String, ThemeData> themes;
  ThemeData _currentTheme;
  ThemeData get currentTheme => _currentTheme;
  ThemeData get initialTheme => themes.values.elementAt(0);

  HoverThemeData({
    @required this.themes,
  }) {
    _currentTheme = themes[themes.keys.elementAt(0)];
  }

  void setThemeByName(String themeName) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('theme', themeName);
    if (themes[themeName] != null) {
      _currentTheme = themes[themeName];
      notifyListeners();
    } else {
      print('Theme "$themeName" not found.');
    }
  }

  Future<String> getCurrentThemeName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('theme');
  }

  void loadSavedTheme() {
    getCurrentThemeName().then((name) {
      setThemeByName(name);
    });
  }
}

class HoverThemeProvider extends ChangeNotifierProvider<HoverThemeData> {
  HoverThemeProvider(HoverThemeData theme) : super(create: (_) => theme);
}
