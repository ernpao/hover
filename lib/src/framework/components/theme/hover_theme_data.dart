import 'package:flutter/material.dart';

class HoverThemeData {
  final String name;
  final ThemeData data;

  HoverThemeData({
    required this.name,
    required this.data,
  });

  static final dark = HoverThemeData(
    name: "hover_dark",
    data: ThemeData.dark().copyWith(
      // errorColor: Colors.orange,
      // backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
    ),
  );

  static final light =
      HoverThemeData(name: "hover_light", data: ThemeData.light());
}
