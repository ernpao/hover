import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/hover_navigation.dart';
import 'hover_global_widgets.dart';

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
  Widget build(BuildContext context);

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
  State<HoverPage> createState() {
    return _HoverPageState();
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
    // Scaffold.of(context).showSnackBar(_snackBar);
    // scaffoldState.showSnackBar(_snackBar);

    if (scaffoldState != null) {
      scaffoldState.showSnackBar(_snackBar);
    }
  }

  HoverRoutingManager _getAppNavigationManager(BuildContext context) {
    return Provider.of<HoverRoutingManager>(context, listen: false);
  }

  void goToInitialPage(BuildContext context, {String sbMessageOnNavigate}) {
    closeDrawer();
    _getAppNavigationManager(context).goToInitialPage(context);
  }

  void goToPage<T>(BuildContext context, {String sbMessageOnNavigate}) {
    closeDrawer();
    _getAppNavigationManager(context).goToPage<T>(context);
  }

  Future<void> pop(BuildContext context, {String sbMessageOnNavigate}) async {
    closeDrawer();
    _getAppNavigationManager(context).pop(context);
  }
}

class _HoverPageState extends State<HoverPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final globalWidgets = Provider.of<HoverGlobalWidgets>(context, listen: true);
    final appBar = widget.buildAppBar(context);
    final drawer = widget.buildDrawer(context);
    final fab = widget.buildFloatingActionButton(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        key: widget.scaffoldKey,
        body: widget.build(context),
        appBar: (appBar != null) ? appBar : globalWidgets.appBar,
        drawer: (drawer != null) ? drawer : globalWidgets.drawer,
        floatingActionButton: (fab != null) ? fab : globalWidgets.floatingActionButton,
      ),
    );
  }
}
