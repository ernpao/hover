import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'hover_page_base.dart';
import 'dependencies/global_widgets/hover_global_widgets.dart';

abstract class HoverSwapper extends HoverPageBase {
  final String title;
  final Color backgroundColor;

  HoverSwapper({
    this.title,
    this.backgroundColor,
  }) : super(title: title, backgroundColor: backgroundColor);

  List<HoverSwapperPage> buildPages(BuildContext context);

  @override
  Widget buildPageContent(BuildContext context) {
    return HoverContentSwapper(
      pages: buildPages(context),
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
  final Widget Function(BuildContext context, int selectedPageIndex, List<Widget> controls) navigationBuilder;

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
    return _HoverContentSwapperState(pages: pages);
  }
}

class _HoverContentSwapperState extends State<HoverContentSwapper> {
  HoverSwapperPage _currentPage;
  int _currentIndex;
  final List<HoverSwapperPage> pages;

  _HoverContentSwapperState({
    @required this.pages,
  });

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _currentPage = pages[_currentIndex];
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
            child: _currentPage,
          ),
        ),
        appBar: (appBar != null) ? appBar : globalWidgets.appBar,
        drawer: (drawer != null) ? drawer : globalWidgets.drawer,
        floatingActionButton: (fab != null) ? fab : globalWidgets.floatingActionButton,
        bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    final List<Widget> controls = List();

    widget.pages.forEach((page) {
      int pageIndex = widget.pages.indexOf(page);

      controls.add(GestureDetector(
        child: page.toggleBuilder(context, (pageIndex == _currentIndex)),
        onTap: () {
          setState(() {
            _currentPage = page;
            _currentIndex = pageIndex;
          });
        },
      ));
    });

    return widget.navigationBuilder(context, _currentIndex, controls);
  }
}

class HoverSwapperPage extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  final Widget Function(BuildContext context, bool isSelected) toggleBuilder;

  HoverSwapperPage({
    @required this.builder,
    @required this.toggleBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
