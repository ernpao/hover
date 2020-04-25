import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'hover_page_base.dart';
import 'providers/global_widgets/hover_global_widgets.dart';

abstract class HoverSwapper extends HoverPageBase {
  final List<HoverSwapperPage> pages;
  final String title;
  final Color backgroundColor;

  HoverSwapper({
    @required this.pages,
    this.title,
    this.backgroundColor,
  }) : super(title: title, backgroundColor: backgroundColor) {
    assert(pages.length > 0);
  }

  @override
  Widget buildPageContent(BuildContext context) {
    return HoverContentSwapper(
      pages: pages,
      scaffoldKey: scaffoldKey,
      appBar: buildAppBar(context),
      drawer: buildDrawer(context),
      fab: buildFloatingActionButton(context),
      backgroundColor: backgroundColor,
      navigationBuilder: buildBottomNavigation,
    );
  }

  Widget buildBottomNavigation(BuildContext context, int currentIndex, List<Widget> controls);

  @override
  Widget build(BuildContext context) {
    return buildPageContent(context);
  }
}

class HoverContentSwapper extends StatefulWidget {
  final List<HoverSwapperPage> pages;
  final Widget appBar;
  final Widget drawer;
  final Widget fab;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Color backgroundColor;
  final Widget Function(BuildContext context, int currentIndex, List<Widget> controls) navigationBuilder;

  HoverContentSwapper({
    @required this.pages,
    @required this.scaffoldKey,
    @required this.navigationBuilder,
    this.backgroundColor,
    this.appBar,
    this.drawer,
    this.fab,
  }) : assert(pages.length > 0);

  @override
  _HoverContentSwapperState createState() {
    return _HoverContentSwapperState();
  }
}

class _HoverContentSwapperState extends State<HoverContentSwapper> {
  Widget Function(BuildContext) _currentContentBuilder;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentContentBuilder = widget.pages[_currentIndex].build;
  }

  @override
  Widget build(BuildContext context) {
    final globalWidgets = Provider.of<HoverGlobalWidgets>(context, listen: false);

    final appBar = widget.appBar;
    final drawer = widget.drawer;
    final fab = widget.fab;
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        key: widget.scaffoldKey,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: Container(
            key: ValueKey<int>(_currentIndex),
            child: _currentContentBuilder(context),
          ),
        ),
        appBar: (appBar != null) ? appBar : globalWidgets.appBar,
        drawer: (drawer != null) ? drawer : globalWidgets.drawer,
        floatingActionButton: (fab != null) ? fab : globalWidgets.floatingActionButton,
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    final List<Widget> controls = List();

    widget.pages.forEach((page) {
      controls.add(GestureDetector(
        child: page.toggle,
        onTap: () {
          setState(() {
            _currentContentBuilder = page.build;
            _currentIndex = widget.pages.indexOf(page);
          });
        },
      ));
    });

    return widget.navigationBuilder(context, _currentIndex, controls);
  }
}

class HoverSwapperPage {
  final Widget Function(BuildContext) build;
  final Widget toggle;

  HoverSwapperPage({
    @required this.build,
    @required this.toggle,
  });
}
