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

  Widget render(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Builder(
          builder: (subcontext) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildAppBar(subcontext),
                Expanded(
                  child: render(subcontext),
                ),
              ],
            );
          },
        ),
        drawer: buildDrawer(context),
        floatingActionButton: buildFloatingActionButton(context),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message, {Duration duration: _defaultSnackBarDuration}) {
    //If the buildSnackBar method was overidden and doesn't return null,
    //use the snackbar created from that method. Else, use globalWidgets.snackBar.
    final globalWidgets = getGlobalWidgets(context);
    var snackBar = buildSnackBar(context);
    snackBar = (snackBar != null) ? snackBar : globalWidgets.snackBarBuilder(context);

    //If both the builSnackBar() and globalWidgets.snackBar are null, use a basic snackbar.
    final _snackBar = (snackBar != null) ? snackBar : SnackBar(content: Text(message), duration: duration);
    Scaffold.of(context).showSnackBar(_snackBar);
  }

  HoverRoutingManager _getAppNavigationManager(BuildContext context) {
    return Provider.of<HoverRoutingManager>(context, listen: false);
  }

  @override
  Future navigateToInitialPage(BuildContext context) {
    closeDrawer(context);
    return _getAppNavigationManager(context).navigateToInitialPage(context);
  }

  @override
  Future navigateTo(String route, BuildContext context, {bool push: false}) {
    closeDrawer(context);
    return _getAppNavigationManager(context).navigateTo(route, context, push: push);
  }

  @override
  Future pop(BuildContext context) {
    closeDrawer(context);
    return _getAppNavigationManager(context).pop(context);
  }

  HoverGlobalWidgets getGlobalWidgets(BuildContext context) {
    return Provider.of<HoverGlobalWidgets>(context, listen: false);
  }

  Widget buildAppBar(BuildContext context) {
    if (getGlobalWidgets(context).appBarBuilder != null) {
      return getGlobalWidgets(context).appBarBuilder(context);
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildDrawer(BuildContext context) {
    if (getGlobalWidgets(context).drawerBuilder != null) {
      return getGlobalWidgets(context).drawerBuilder(context);
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildSnackBar(BuildContext context) {
    return getGlobalWidgets(context).snackBarBuilder(context);
  }

  Widget buildFloatingActionButton(BuildContext context) {
    if (getGlobalWidgets(context).floatingActionButtonBuilder != null) {
      return getGlobalWidgets(context).floatingActionButtonBuilder(context);
    } else {
      return SizedBox.shrink();
    }
  }
}
