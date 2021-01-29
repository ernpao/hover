import 'package:flutter/cupertino.dart';
import '../../framework/hover_app.dart';

class HoverResponsiveGrid extends StatelessWidget {
  /// The maximum number of columns per row on desktop view.
  final int columnsPerRow;

  /// The maximum number of columns per row on tablet view.
  final int tabletColumnsPerRow;

  /// The screen width at which the view for tablets is rendered.
  final int tabletBreakpoint;

  /// The screen width at which the view for mobile phones is rendered.
  final int mobilePhoneBreakpoint;

  /// The widgets to render inside this grid.
  final List<Widget> columns;

  /// Displays a grid of widgets with columns are equal in width.
  ///
  /// The number of columns rendered is determined by the width of the device.
  HoverResponsiveGrid({
    this.columnsPerRow: 3,
    this.tabletColumnsPerRow: 2,
    this.mobilePhoneBreakpoint: 575,
    this.tabletBreakpoint: 768,
    @required this.columns,
  }) : assert(columnsPerRow > 0 && tabletBreakpoint > mobilePhoneBreakpoint);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = columnsPerRow;

    final screenWidth = Hover.getScreenWidth(context);

    if (screenWidth > tabletBreakpoint) {
      crossAxisCount = columnsPerRow;
    } else if (screenWidth > mobilePhoneBreakpoint &&
        screenWidth <= tabletBreakpoint) {
      crossAxisCount = tabletColumnsPerRow;
    } else {
      crossAxisCount = 1;
    }
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: columns,
    );
  }
}
