import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HoverThemeData extends ChangeNotifier {
  final Map<String, ThemeData> themes;
  String _currentThemeName;

  ThemeData get currentTheme => _getCurrentTheme();
  String get currentThemeName => _currentThemeName;

  HoverThemeData({
    this.themes,
  }) {
    _currentThemeName = themes.keys.elementAt(0);
  }

  void setThemeByName(String themeName) {
    _currentThemeName = themeName;
    notifyListeners();
  }

  ThemeData _getCurrentTheme() {
    return themes[_currentThemeName];
  }

  void addTheme(String themeName, ThemeData theme) {
    themes.addAll({themeName: theme});
  }

  void updateTheme(String themeName, ThemeData theme) {
    themes[themeName] = theme;
  }
}

class HoverThemeProvider extends ChangeNotifierProvider<HoverThemeData> {
  HoverThemeProvider(HoverThemeData theme) : super(create: (_) => theme);
}
