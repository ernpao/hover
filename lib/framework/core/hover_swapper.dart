import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'hover_core.dart';

abstract class HoverSwapper extends HoverPageBase {
  final List<HoverSwapperPage> pages;
  final Color backgroundColor;

  HoverSwapper({
    @required this.pages,
    this.backgroundColor,
  }) : assert(pages.length > 0);

  @override
  Widget build(BuildContext context) {
    return HoverContentSwapper(
      pages: pages,
      scaffoldKey: this.scaffoldKey,
    );
  }
}

class HoverContentSwapper extends StatefulWidget {
  final List<HoverSwapperPage> pages;
  final Color backgroundColor;
  final GlobalKey<ScaffoldState> scaffoldKey;

  HoverContentSwapper({
    @required this.pages,
    @required this.scaffoldKey,
    this.backgroundColor,
  }) : assert(pages.length > 0);

  @override
  _HoverContentSwapperState createState() {
    return _HoverContentSwapperState();
  }
}

class _HoverContentSwapperState extends State<HoverContentSwapper> {
  Widget _currentContent;

  @override
  void initState() {
    super.initState();
    _currentContent = widget.pages[0].content;
  }

  @override
  Widget build(BuildContext context) {
    final globalWidgets = Provider.of<HoverGlobalWidgets>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        key: widget.scaffoldKey,
        body: _currentContent,
        backgroundColor: widget.backgroundColor,
        bottomNavigationBar: _buildBottomNavigation(),
        appBar: globalWidgets.appBar,
      ),
    );
  }

  Widget _buildBottomNavigation() {
    final List<Widget> controls = List();

    widget.pages.forEach((page) {
      controls.add(FlatButton(
        child: page.toggle,
        onPressed: () {
          setState(() {
            _currentContent = page.content;
          });
        },
      ));
    });

    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controls,
      ),
    );
  }
}

class HoverSwapperPage {
  final Widget content;
  final Widget toggle;

  HoverSwapperPage({
    @required this.content,
    @required this.toggle,
  });
}
