import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/hover_navigation.dart';
import '../core/hover_global_widgets.dart';

abstract class HoverPage extends HoverRoute {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final String title;
  final Color backgroundColor;
  static const Duration _defaultSnackBarDuration = Duration(seconds: 2);

  HoverPage({
    this.title,
    this.backgroundColor,
  });

  /// Build the content of the page by overriding this method.
  Widget buildContent(BuildContext context);

  AppBar buildAppBar(BuildContext context) {
    if (title != null) {
      return AppBar(
        title: Text(title),
      );
    }
    return null;
  }

  Drawer buildDrawer(BuildContext context) {
    return null;
  }

  SnackBar buildSnackBar(BuildContext context) {
    return null;
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final globalWidgets = Provider.of<HoverGlobalWidgets>(context, listen: false);

    final appBar = buildAppBar(context);
    final drawer = buildDrawer(context);
    final fab = buildFloatingActionButton(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        key: scaffoldKey,
        body: buildContent(context),
        appBar: (appBar != null) ? appBar : globalWidgets.appBar,
        drawer: (drawer != null) ? drawer : globalWidgets.drawer,
        floatingActionButton: (fab != null) ? fab : globalWidgets.floatingActionButton,
      ),
    );
  }

  void openDrawer() {
    if (scaffoldState.hasDrawer) {
      scaffoldKey.currentState.openDrawer();
    }
  }

  void closeDrawer() {
    if (scaffoldState.hasDrawer && scaffoldState.isDrawerOpen) {
      Navigator.pop(scaffoldState.context);
    }
  }

  ScaffoldState get scaffoldState => scaffoldKey.currentState;

  ///Utility method to get the device's screen width
  double getScreenWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  ///Utility method to get the device's screen height
  double getScreenHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  void showSnackBar(BuildContext context, String message, {Duration duration: _defaultSnackBarDuration}) {
    //If the buildSnackBar method was overidden and doesn't return null,
    //use the snackbar created from that method. Else, use globalWidgets.snackBar.
    final globalWidgets = Provider.of<HoverGlobalWidgets>(context, listen: false);
    var snackBar = buildSnackBar(context);
    snackBar = (snackBar != null) ? snackBar : globalWidgets.snackBar;

    //If both the builSnackBar() and globalWidgets.snackBar are null, use a basic snackbar.
    final _snackBar = (snackBar != null) ? snackBar : SnackBar(content: Text(message), duration: duration);
    scaffoldState.showSnackBar(_snackBar);
  }

  HoverRouter _getAppNavigationManager(BuildContext context) {
    return Provider.of<HoverRouter>(context, listen: false);
  }

  Future navigateToInitialPage(BuildContext context) {
    closeDrawer();
    return _getAppNavigationManager(context).goToInitialPage(context, scaffoldKey);
  }

  Future navigateTo(BuildContext context, HoverPage page) {
    closeDrawer();
    return _getAppNavigationManager(context).goTo(context, page);
  }

  void popNavigation(BuildContext context, {Object returnData}) {
    closeDrawer();
    _getAppNavigationManager(context).pop(context, returnData: returnData);
  }
}
