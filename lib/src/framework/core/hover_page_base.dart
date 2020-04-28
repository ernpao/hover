import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'structure/hover_scaffold.dart';
import 'structure/hover_snackbar_displayer.dart';
import 'dependencies/helpers/hover_snackbar_helper.dart';
import 'dependencies/navigation/routing/hover_route.dart';
import 'dependencies/navigation/routing/hover_router.dart';
import 'dependencies/global_widgets/hover_global_widgets.dart';

abstract class HoverPageBase extends HoverScaffold implements HoverRoute, HoverNavigation, HoverSnackBarDisplayer {
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

  Widget buildFloatingActionButton(BuildContext context) {
    if (getGlobalWidgets(context).floatingActionButtonBuilder != null) {
      return getGlobalWidgets(context).floatingActionButtonBuilder(context);
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  void showSnackBar(BuildContext context, Widget content, {Duration duration}) {
    HoverSnackBarHelper.showSnackBar(context, content, duration: duration);
  }

  @override
  void showPlainSnackBar(BuildContext context, String message, {Duration duration}) {
    HoverSnackBarHelper.showPlainSnackBar(context, message, duration: duration);
  }

  @override
  Widget regenerate(BuildContext context) {
    return build(context);
  }
}
