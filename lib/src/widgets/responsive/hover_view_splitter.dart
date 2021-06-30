import 'package:flutter/material.dart';

enum HoverViewSplitterPosition {
  left,
  right,
}

class HoverViewSplitter extends StatelessWidget {
  /// The widget to display on the main view (left side by default) of the split.
  final Widget mainViewChild;

  /// The widget to display on the sub view (right side by default) of the split.
  final Widget subViewChild;

  /// Flag that toggles wether to show the sub view or not.
  final bool? showSubView;

  /// Determines wether to show the sub view on the left or right side of the split.
  final HoverViewSplitterPosition? subViewPosition;

  /// Ratio of the split for the main view (left side). This is
  /// set to 1 by default.
  ///
  /// For example, setting a value of 1
  /// for [mainViewFlex] and 2 for [subViewFlex] would
  /// give the main view 1/3 of the split while sub view
  /// would get 2/3 of the split when [showSubView] is true.
  final double? mainViewFlex;

  /// Ratio of the split for the sub view (right side). This is
  /// set to 1 by default.
  ///
  /// For example, setting a value of 1
  /// for [mainViewFlex] and 2 for [subViewFlex] would
  /// give the main view 1/3 of the split while sub view
  /// would get 2/3 of the split when [showSubView] is true.
  final double? subViewFlex;

  /// Duration to use for the animation of the split.
  final Duration? duration;

  /// Curve to use for the animation of the split.
  final Curve? curve;

  HoverViewSplitter({
    required this.mainViewChild,
    required this.subViewChild,
    this.subViewPosition,
    this.showSubView: false,
    this.mainViewFlex: 1,
    this.subViewFlex: 1,
    this.duration,
    this.curve,
  });
  double get _totalFlex => _mainViewFlex + _subViewFlex;
  double get _mainViewFlex => mainViewFlex ?? _defaultMainViewFlex;
  double get _subViewFlex => subViewFlex ?? _defaultSubViewFlex;

  final double _defaultSubViewFlex = 1;
  final double _defaultMainViewFlex = 1;
  final Duration _defaultDuration = const Duration(milliseconds: 300);
  final Curve _defaultCurve = Curves.easeInOut;

  bool get showSubViewOnLeft =>
      subViewPosition == HoverViewSplitterPosition.left;
  bool get showSubViewOnRight => !showSubViewOnLeft;

  Widget _buildMainView(BoxConstraints constraints) {
    return AnimatedContainer(
      duration: duration ?? _defaultDuration,
      curve: curve ?? _defaultCurve,
      width: showSubView ?? false
          ? constraints.maxWidth * (_mainViewFlex / _totalFlex)
          : constraints.maxWidth,
      child: mainViewChild,
    );
  }

  Widget _buildSubView(BoxConstraints constraints) {
    return AnimatedContainer(
      duration: duration ?? _defaultDuration,
      curve: curve ?? _defaultCurve,
      width: showSubView ?? false
          ? constraints.maxWidth * (_subViewFlex / _totalFlex)
          : 0,
      child: subViewChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              showSubViewOnLeft
                  ? _buildSubView(constraints)
                  : _buildMainView(constraints),
              showSubViewOnRight
                  ? _buildSubView(constraints)
                  : _buildMainView(constraints),
            ],
          ),
        );
      }),
    );
  }
}
