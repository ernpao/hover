import 'package:flutter/material.dart';

abstract class HoverScaffold extends StatelessWidget {
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

  bool isDrawerOpen(BuildContext context) {
    return Scaffold.of(context).isDrawerOpen;
  }

  bool hasDrawer(BuildContext context) {
    return Scaffold.of(context).hasDrawer;
  }

  void openDrawer(BuildContext context) {
    if (hasDrawer(context)) {
      Scaffold.of(context).openDrawer();
    }
  }

  void closeDrawer(BuildContext context) {
    if (hasDrawer(context) && isDrawerOpen(context)) {
      Navigator.pop(context);
    }
  }

  void toggleDrawer(BuildContext context) {
    if (!isDrawerOpen(context)) {
      openDrawer(context);
    } else {
      closeDrawer(context);
    }
  }
}
