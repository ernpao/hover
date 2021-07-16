import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hover_theme_data.dart';

class HoverThemeSettings extends ChangeNotifier {
  HoverThemeSettings({
    required this.themes,
  }) {
    _currentTheme = initialTheme;
  }

  late final List<HoverThemeData> themes;
  late HoverThemeData _currentTheme;

  HoverThemeData get currentTheme => _currentTheme;
  HoverThemeData get initialTheme => themes[0];

  List<String> get themeNames => themes.map((t) => t.name).toList();

  void setThemeByName(String themeName) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final theme = _getThemeByName(themeName);
    if (theme != null) {
      _currentTheme = theme;
      await sharedPreferences.setString('theme', themeName);
    } else {
      print('Theme "$themeName" not found.');
      print('Using theme "${initialTheme.name}" instead.');
      _currentTheme = initialTheme;
      await sharedPreferences.setString('theme', initialTheme.name);
    }
    notifyListeners();
  }

  HoverThemeData? _getThemeByName(String themeName) {
    final filteredThemes = themes.where((t) => t.name == themeName).toList();
    return filteredThemes.isNotEmpty ? filteredThemes.first : null;
  }

  Future<String?> getSavedThemeName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('theme');
  }

  /// Load the saved theme. If no saved theme is found Hover will use the first theme available and save the setting.
  void loadSavedTheme() {
    getSavedThemeName().then((name) {
      if (name == null) {
        setThemeByName(initialTheme.name);
      } else {
        setThemeByName(name);
      }
    });
  }
}

class HoverThemeSettingsProvider
    extends ChangeNotifierProvider<HoverThemeSettings> {
  HoverThemeSettingsProvider(HoverThemeSettings themeSettings)
      : super(create: (_) => themeSettings);
}
