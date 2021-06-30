import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hover/framework.dart';
import 'package:hover/widgets.dart';

class MobileResponsivenessExample extends HoverPage {
  @override
  Widget render(BuildContext context) {
    bool showSubView = kIsWeb;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: HoverResponsiveBuilder(
            builder: (_, __) => Text("Desktop view!"),
            tabletViewBuilder: (_, __) => Text("Tablet view!"),
            phoneViewBuilder: (_, __) => Text("Phone view!"),
          ),
        ),
        Expanded(
          child: HoverViewSplitter(
            showSubView: showSubView,
            // subViewPosition: HoverViewSplitterPosition.left,
            mainViewChild: HoverResponsiveGrid(
              columnsPerRow: showSubView ? 3 : 5,
              columnsPerRowOnTablets: showSubView ? 2 : 4,
              columnsPerRowOnPhones: showSubView ? 1 : 2,
              children: _createDummyItems(20),
            ),
            subViewChild: SizedBox.shrink(),
          ),
        )
      ],
    );
  }

  List<Widget> _createDummyItems(int count) {
    List<Widget> widgets = [];

    for (var i = 0; i < count; i++) {
      widgets.add(HoverBaseCard(child: Text("Column ${count + 1}")));
    }

    return widgets;
  }

  @override
  String get routeName => "/mobile-responsiveness-example";
}
