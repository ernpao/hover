import 'package:flutter/material.dart';

class HoverDimensionsHelper {
  /// Utility method to get the device's screen width
  static double getScreenWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  /// Utility method to get the device's screen height
  static double getScreenHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }
}
