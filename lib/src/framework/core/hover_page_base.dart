import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/global_widgets/hover_global_widgets.dart';
import 'components/navigation/routing/hover_route.dart';

abstract class HoverPageBase extends StatelessWidget implements HoverRoute {
  HoverPageBase({
    this.title,
    this.backgroundColor,
    this.disableAppBar = false,
    this.disableDrawer = false,
    this.disableFAB = false,
  });

  /// Title of the page. Currently unused by Hover in any mechanisms.
  final String? title;

  /// Color to use for the background of the page.
  final Color? backgroundColor;

  /// Determines whether the page should disable the global app bar builder.
  final bool disableAppBar;

  /// Determines whether the page should disable the global drawer builder.
  final bool disableDrawer;

  /// Determines whether the page should disable the global FAB builder.
  final bool disableFAB;

  /// Builder function for the content of the page. Additionally,
  /// the widget created by ths function will be
  /// placed under an [Expanded] widget, which in turn is nested
  /// under a [Column] with a crossAxisAlignment property set to
  /// [CrossAxisAlignment.stretch] and mainAxisAlignment set to
  /// [MainAxisAlignment.start].
  Widget render(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Builder(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildAppBar(context),
                Expanded(
                  child: render(context),
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
    if (_getGlobalWidgets(context).appBarBuilder != null && !disableAppBar) {
      return _getGlobalWidgets(context).appBarBuilder!(context);
    }
    return SizedBox.shrink(); // Can't be null since it is a child of a Column
  }

  Widget? buildDrawer(BuildContext context) {
    if (_getGlobalWidgets(context).drawerBuilder != null && !disableDrawer) {
      return _getGlobalWidgets(context).drawerBuilder!(context);
    }
    return null;
  }

  Widget? buildFloatingActionButton(BuildContext context) {
    if (_getGlobalWidgets(context).fabBuilder != null && !disableFAB) {
      return _getGlobalWidgets(context).fabBuilder!(context);
    }
    return null;
  }

  @override
  Widget generateRouteContent(BuildContext context) => build(context);
}
