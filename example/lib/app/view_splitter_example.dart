import 'package:flutter/material.dart';
import 'package:hover/framework.dart';
import 'package:hover/widgets.dart';

class ViewSplitterExample extends HoverPage {
  @override
  Widget render(BuildContext context) => _ViewSplitterExampleContent();

  @override
  String get routeName => "/view-splitter-example";
}

class _ViewSplitterExampleContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewSplitterExampleContentState();
}

class _ViewSplitterExampleContentState
    extends State<_ViewSplitterExampleContent> {
  bool _showSubView;
  @override
  void initState() {
    _showSubView = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _showSubView ? Icons.close : Icons.open_in_browser,
        ),
        onPressed: () {
          setState(() {
            _showSubView = !_showSubView;
          });
        },
      ),
      body: HoverViewSplitter(
        subViewFlex: 1,
        mainViewFlex: 1,
        mainViewChild: Container(
          color: Colors.amber,
          constraints: BoxConstraints.expand(),
        ),
        subViewChild: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.red,
        ),
        showSubView: _showSubView,
      ),
    );
  }
}
