import 'package:flutter/material.dart';

class HoverSnackBarHelper {
  static const Duration defaultSnackBarDuration = const Duration(seconds: 2);

  static void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showPlainSnackBar(BuildContext context, String message,
      {Duration duration: defaultSnackBarDuration}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message), duration: duration));
  }
}
