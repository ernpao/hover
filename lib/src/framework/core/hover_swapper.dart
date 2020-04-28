import 'package:flutter/material.dart';
import 'hover_page_base.dart';

abstract class HoverSwapper extends HoverPageBase {
  final String title;
  final Color backgroundColor;

  HoverSwapper({
    this.title,
    this.backgroundColor,
  }) : super(title: title, backgroundColor: backgroundColor);

  List<HoverSwapperPage> buildPages(BuildContext context);

  @override
  Widget render(BuildContext context) {
    return _HoverContentSwapper(
      pages: buildPages(context),
      appBarBuilder: buildAppBar,
      drawerBuilder: buildDrawer,
      floatingActionButtonBuilder: buildFloatingActionButton,
      backgroundColor: backgroundColor,
      navigationBuilder: buildBottomNavigation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }

  Widget buildBottomNavigation(BuildContext context, int currentIndex, List<Widget> controls);
}

class _HoverContentSwapper extends StatefulWidget {
  final Color backgroundColor;
  final List<HoverSwapperPage> pages;
  final Widget Function(BuildContext) appBarBuilder;
  final Widget Function(BuildContext) drawerBuilder;
  final Widget Function(BuildContext) floatingActionButtonBuilder;
  final Widget Function(BuildContext context, int selectedPageIndex, List<Widget> controls) navigationBuilder;

  _HoverContentSwapper({
    @required this.pages,
    @required this.navigationBuilder,
    this.backgroundColor,
    this.appBarBuilder,
    this.drawerBuilder,
    this.floatingActionButtonBuilder,
  }) : assert(pages.length > 0);

  @override
  _HoverContentSwapperState createState() {
    return _HoverContentSwapperState(pages: pages);
  }
}

class _HoverContentSwapperState extends State<_HoverContentSwapper> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: Builder(
            builder: (subcontext) {
              return Column(
                children: <Widget>[
                  widget.appBarBuilder(subcontext),
                  Expanded(
                    child: Container(
                      key: ValueKey<int>(_currentIndex),
                      child: _currentPage,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        drawer: widget.drawerBuilder(context),
        floatingActionButton: widget.floatingActionButtonBuilder(context),
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
