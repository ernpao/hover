import 'package:flutter/material.dart';
import 'package:hover/hover.dart';
import 'package:hover/hover_widgets.dart';

class MobileResponsivenessExample extends HoverPage {
  @override
  Widget render(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: HoverResponsiveGrid(
            columnsPerRow: 5,
            tabletColumnsPerRow: 4,
            columns: [
              HoverBaseCard(child: Text("Column 1")),
              HoverBaseCard(child: Text("Column 2")),
              HoverBaseCard(child: Text("Column 3")),
              HoverBaseCard(child: Text("Column 2")),
              HoverBaseCard(child: Text("Column 3")),
            ],
          ),
        ),
      ],
    );
  }

  @override
  String get routeName => "/mobile-responsiveness-example";
}
