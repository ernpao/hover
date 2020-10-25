import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependencies/navigation/routing/hover_route.dart';
import 'dependencies/global_widgets/hover_global_widgets.dart';

abstract class HoverPageBase extends StatelessWidget implements HoverRoute {
  /// Title of the page. Currently unused by Hover in any mechanisms.
  final String title;

  /// Color to use for the background of the page.
  final Color backgroundColor;

  HoverPageBase({
    this.title,
    this.backgroundColor,
  });

  /// Similar to the build method for widgets, this
  /// describes the part of the user interface represented
  /// by this widget.
  ///
  /// Note that widget returned by this function will be
  /// placed under an Expanded widget, which in turn is nested
  /// under a Column with a crossAxisAlignment property set to
  /// CrossAxisAlignment.stretch and mainAxisAlignment set to
  /// MainAxisAlignment.start.
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

  HoverGlobalWidgets _getGlobalWidgets(BuildContext context) {
    return Provider.of<HoverGlobalWidgets>(context, listen: false);
  }

  Widget buildAppBar(BuildContext context) {
    if (_getGlobalWidgets(context).appBarBuilder != null) {
      return _getGlobalWidgets(context).appBarBuilder(context);
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildDrawer(BuildContext context) {
    if (_getGlobalWidgets(context).drawerBuilder != null) {
      return _getGlobalWidgets(context).drawerBuilder(context);
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildFloatingActionButton(BuildContext context) {
    if (_getGlobalWidgets(context).floatingActionButtonBuilder != null) {
      return _getGlobalWidgets(context).floatingActionButtonBuilder(context);
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget regenerate(BuildContext context) {
    return build(context);
  }
}
