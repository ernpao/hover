import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation/hover_navigation.dart';

abstract class HoverPage extends HoverRoute {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final String title;
  final Color backgroundColor;
  static const Duration _defaultSnackBarDuration = Duration(seconds: 2);

  HoverPage({
    this.title: "",
    this.backgroundColor,
  });

  Widget buildContent(BuildContext context, ScaffoldState scaffoldState);
  AppBar buildAppBar(BuildContext context, ScaffoldState scaffoldState);
  Drawer buildDrawer(BuildContext context, ScaffoldState scaffoldState);
  SnackBar buildSnackBar(BuildContext context, ScaffoldState scaffoldState);
  Widget buildFloatingActionButton(BuildContext context, ScaffoldState scaffoldState);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        key: scaffoldKey,
        appBar: _appBarBuilder(context, scaffoldState),
        body: buildContent(context, scaffoldState),
        drawer: buildDrawer(context, scaffoldState),
        floatingActionButton: buildFloatingActionButton(context, scaffoldState),
      ),
    );
  }

  AppBar _appBarBuilder(BuildContext context, ScaffoldState scaffoldState) {
    if (buildAppBar == null) {
      return AppBar(
        title: Text(title),
      );
    }
    return buildAppBar(context, scaffoldState);
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

  double getScreenWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  double getScreenHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  void showSnackBar(BuildContext context, String message, {Duration duration: _defaultSnackBarDuration}) {
    final SnackBar _snackBar = (buildSnackBar(context, scaffoldState) != null)
        ? buildSnackBar(context, scaffoldState)
        : SnackBar(content: Text(message), duration: duration);
    this.scaffoldKey.currentState.showSnackBar(_snackBar);
  }

  HoverRouter _getAppNavigationManager(BuildContext context) {
    return Provider.of<HoverRouter>(context, listen: false);
  }

  /* Static methods for navigation */
  Future navigateToInitialPage(
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) {
    closeDrawer();
    return _getAppNavigationManager(context).goToInitialPage(context, scaffoldKey);
  }

  @deprecated
  Future navigateToPage(
    BuildContext context,
    String pageRouteName,
    GlobalKey<ScaffoldState> scaffoldKey, {
    Object data,
  }) {
    closeDrawer();
    return _getAppNavigationManager(context).goToPage(context, pageRouteName, scaffoldKey, data: data);
  }

  Future navigateTo(BuildContext context, HoverRoute page) {
    closeDrawer();
    return _getAppNavigationManager(context).goTo(context, page);
  }

  void popNavigation(BuildContext context, {Object returnData}) {
    closeDrawer();
    _getAppNavigationManager(context).pop(context, returnData: returnData);
  }
}
