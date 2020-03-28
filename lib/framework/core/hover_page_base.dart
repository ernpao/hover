import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'hover_core.dart';

abstract class HoverPageBase extends HoverScaffold implements HoverRoute {
  static const Duration _defaultSnackBarDuration = Duration(seconds: 2);
  final String title;
  final Color backgroundColor;

  HoverPageBase({
    this.title,
    this.backgroundColor,
  });

  Widget buildAppBar(BuildContext context) {
    if (title != null) {
      return AppBar(
        title: Text(title),
      );
    }
    return null;
  }

  HoverGlobalWidgets getGlobalWidgets(BuildContext context) {
    return Provider.of<HoverGlobalWidgets>(context, listen: false);
  }

  void openDrawer() {
    if (state.hasDrawer) {
      key.currentState.openDrawer();
    }
  }

  void closeDrawer() {
    if (state.hasDrawer && state.isDrawerOpen) {
      Navigator.pop(state.context);
    }
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

    if (state != null) {
      state.showSnackBar(_snackBar);
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
