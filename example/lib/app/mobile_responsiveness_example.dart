import 'package:flutter/material.dart';
import 'package:hover/framework.dart';
import 'package:hover/widgets.dart';

class MobileResponsivenessExample extends HoverPage {
  @override
  Widget render(BuildContext context) {
    return Column(
      children: [
        HoverResponsiveBuilder(
          builder: (_, __) => Text("Desktop view!"),
          tabletViewBuilder: (_, __) => Text("Tablet view!"),
          phoneViewBuilder: (_, __) => Text("Phone view!"),
        ),
        Expanded(
          child: HoverResponsiveGrid(
            columnsPerRow: 5,
            columnsPerRowOnTablets: 4,
            columnsPerRowOnPhones: 2,
            children: [
              HoverBaseCard(child: Text("Column 1")),
              HoverBaseCard(child: Text("Column 2")),
              HoverBaseCard(child: Text("Column 3")),
              HoverBaseCard(child: Text("Column 2")),
              HoverBaseCard(child: Text("Column 3")),
            ],
          ),
        )
      ],
    );
  }

  @override
  String get routeName => "/mobile-responsiveness-example";
}
