import 'package:flutter/material.dart';

class HoverDrawerHelper {
  static bool isDrawerOpen(BuildContext context) => Scaffold.of(context).isDrawerOpen;

  static bool hasDrawer(BuildContext context) => Scaffold.of(context).hasDrawer;

  static void openDrawer(BuildContext context) {
    if (hasDrawer(context)) {
      Scaffold.of(context).openDrawer();
    }
  }

  static void closeDrawer(BuildContext context) {
    if (hasDrawer(context) && isDrawerOpen(context)) {
      Navigator.pop(context);
    }
  }

  static void toggleDrawer(BuildContext context) {
    if (!isDrawerOpen(context)) {
      openDrawer(context);
    } else {
      closeDrawer(context);
    }
  }
}
