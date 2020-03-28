import 'package:flutter/material.dart';

abstract class HoverScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  ScaffoldState get currentState => scaffoldKey.currentState;
  BuildContext get currentContext => scaffoldKey.currentState.context;

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

  get isDrawerOpen => scaffoldKey.currentState.isDrawerOpen;

  void openDrawer() {
    if (currentState.hasDrawer) {
      currentState.openDrawer();
    }
  }

  void closeDrawer() {
    if (currentState.hasDrawer && currentState.isDrawerOpen) {
      Navigator.pop(currentState.context);
    }
  }

  Widget buildAppBar(BuildContext context) {
    return null;
  }

  Widget buildDrawer(BuildContext context) {
    return null;
  }

  Widget buildSnackBar(BuildContext context) {
    return null;
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return null;
  }
}
