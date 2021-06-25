import 'package:flutter/cupertino.dart';

class HoverResponsiveGrid extends StatelessWidget {
  /// The maximum number of columns per row on desktop view.
  final int columnsPerRow;

  /// The maximum number of columns per row on tablet view.
  final int columnsPerRowOnTablets;

  /// The maximum number of columns per row on mobile phones.
  final int columnsPerRowOnPhones;

  /// The screen width at which the view for tablets is rendered.
  final int breakpointForTablets;

  /// The screen width at which the view for mobile phones is rendered.
  final int breakpointForPhones;

  /// The widgets to render inside this grid.
  final List<Widget> children;

  /// Displays a grid of widgets with columns are equal in width.
  ///
  /// The number of columns rendered is determined by the width of the device.
  HoverResponsiveGrid({
    this.columnsPerRow: 3,
    this.columnsPerRowOnTablets: 2,
    this.columnsPerRowOnPhones: 1,
    this.breakpointForPhones: 575,
    this.breakpointForTablets: 768,
    required this.children,
  }) : assert(columnsPerRow > 0 && breakpointForTablets > breakpointForPhones);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = columnsPerRow;
    final screenWidth = MediaQuery.of(context).size.width;

    MediaQuery.of(context).size.width;
    if (screenWidth > breakpointForTablets) {
      crossAxisCount = columnsPerRow;
    } else if (screenWidth > breakpointForPhones &&
        screenWidth <= breakpointForTablets) {
      crossAxisCount = columnsPerRowOnTablets;
    } else {
      crossAxisCount = columnsPerRowOnPhones;
    }
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: children,
    );
  }
}
