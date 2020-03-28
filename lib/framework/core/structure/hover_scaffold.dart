import 'package:flutter/material.dart';

abstract class HoverScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  ScaffoldState get state => key.currentState;

  /// Utility method to get the device's screen width
  double getScreenWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  /// Utility method to get the device's screen height
  double getScreenHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }
}
