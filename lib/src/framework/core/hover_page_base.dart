import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'structure/hover_scaffold.dart';
import 'dependencies/navigation/routing/hover_route.dart';
import 'dependencies/navigation/routing/hover_router.dart';
import 'dependencies/global_widgets/hover_global_widgets.dart';

abstract class HoverPageBase extends HoverScaffold implements HoverRoute, HoverNavigation {
  static const Duration _defaultSnackBarDuration = Duration(seconds: 2);
  final String title;
  final Color backgroundColor;

  HoverPageBase({
    this.title,
    this.backgroundColor,
  });

  HoverGlobalWidgets getGlobalWidgets(BuildContext context) {
    return Provider.of<HoverGlobalWidgets>(context, listen: false);
  }

  Widget buildPageContent(BuildContext context);

  /// Build the content of the page by overriding this method.
  @override
  Widget build(BuildContext context) {
    final globalWidgets = getGlobalWidgets(context);

    final appBar = buildAppBar(context);
    final drawer = buildDrawer(context);
    final fab = buildFloatingActionButton(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        key: scaffoldKey,
        body: buildPageContent(context),
        appBar: (appBar != null) ? appBar : globalWidgets.appBar,
        drawer: (drawer != null) ? drawer : globalWidgets.drawer,
        floatingActionButton: (fab != null) ? fab : globalWidgets.floatingActionButton,
      ),
    );
  }

  void showSnackBar(BuildContext context, String message, {Duration duration: _defaultSnackBarDuration}) {
    //If the buildSnackBar method was overidden and doesn't return null,
    //use the snackbar created from that method. Else, use globalWidgets.snackBar.
    final globalWidgets = Provider.of<HoverGlobalWidgets>(context, listen: false);
    var snackBar = buildSnackBar(context);
    snackBar = (snackBar != null) ? snackBar : globalWidgets.snackBar;

    //If both the builSnackBar() and globalWidgets.snackBar are null, use a basic snackbar.
    final _snackBar = (snackBar != null) ? snackBar : SnackBar(content: Text(message), duration: duration);

    if (currentState != null) {
      currentState.showSnackBar(_snackBar);
    }
  }

  HoverRoutingManager _getAppNavigationManager(BuildContext context) {
    return Provider.of<HoverRoutingManager>(context, listen: false);
  }

  @override
  Future navigateToInitialPage(BuildContext context) {
    closeDrawer();
    return _getAppNavigationManager(context).navigateToInitialPage(context);
  }

  @override
  Future navigateTo(String route, BuildContext context, {bool push: false}) {
    closeDrawer();
    return _getAppNavigationManager(context).navigateTo(route, context, push: push);
  }

  @override
  Future pop(BuildContext context) {
    closeDrawer();
    return _getAppNavigationManager(context).pop(context);
  }
}
