import 'package:flutter/material.dart';
import 'hover_core.dart';

abstract class HoverPage extends HoverPageBase {
  HoverPage({
    String title,
    Color backgroundColor,
  }) : super(title: title, backgroundColor: backgroundColor);

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
        key: key,
        body: build(context),
        appBar: (appBar != null) ? appBar : globalWidgets.appBar,
        drawer: (drawer != null) ? drawer : globalWidgets.drawer,
        floatingActionButton: (fab != null) ? fab : globalWidgets.floatingActionButton,
      ),
    );
  }
}
