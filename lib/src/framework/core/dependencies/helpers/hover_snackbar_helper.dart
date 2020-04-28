import 'package:flutter/material.dart';

class HoverSnackBarHelper {
  static const Duration defaultSnackBarDuration = Duration(seconds: 2);

  static void showSnackBar(BuildContext context, Widget content, {Duration duration: defaultSnackBarDuration}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: content, duration: duration));
  }

  static void showPlainSnackBar(BuildContext context, String message, {Duration duration: defaultSnackBarDuration}) {
    showSnackBar(context, Text(message), duration: duration);
  }
}
