import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'structure/hover_scaffold.dart';
import 'dependencies/navigation/routing/hover_route.dart';
import 'dependencies/global_widgets/hover_global_widgets.dart';

abstract class HoverPageBase extends HoverScaffold implements HoverRoute {
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
