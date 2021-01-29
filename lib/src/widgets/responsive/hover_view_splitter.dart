import 'package:flutter/material.dart';

class HoverViewSplitter extends StatefulWidget {
  /// The widget to display on the main view (left side) of the split.
  final Widget mainViewChild;

  /// The widget to display on the sub view (right side) of the split.
  final Widget subViewChild;

  /// Flag that toggles wether to show the sub view or not.
  final bool showSubView;

  /// Ratio of the split for the main view (left side). This is
  /// set to 1 by default.
  ///
  /// For example, setting a value of 1
  /// for [mainViewFlex] and 2 for [subViewFlex] would
  /// give the main view 1/3 of the split while sub view
  /// would get 2/3 of the split when [showSubView] is true.
  final double mainViewFlex;

  /// Ratio of the split for the sub view (right side). This is
  /// set to 1 by default.
  ///
  /// For example, setting a value of 1
  /// for [mainViewFlex] and 2 for [subViewFlex] would
  /// give the main view 1/3 of the split while sub view
  /// would get 2/3 of the split when [showSubView] is true.
  final double subViewFlex;

  /// Duration to use for the animation of the split.
  final Duration duration;

  /// Curve to use for the animation of the split.
  final Curve curve;

  HoverViewSplitter({
    @required this.mainViewChild,
    @required this.subViewChild,
    this.showSubView: false,
    this.mainViewFlex: 1,
    this.subViewFlex: 1,
    this.duration: const Duration(milliseconds: 300),
    this.curve: Curves.easeInOut,
  });
  @override
  State<StatefulWidget> createState() {
    return _HoverViewSplitterState();
  }
}

class _HoverViewSplitterState extends State<HoverViewSplitter> {
  double get _totalFlex => widget.mainViewFlex + widget.subViewFlex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          AnimatedContainer(
            duration: widget.duration,
            curve: widget.curve,
            width: widget.showSubView
                ? constraints.maxWidth * (widget.mainViewFlex / _totalFlex)
                : constraints.maxWidth,
            child: widget.mainViewChild,
          ),
          AnimatedContainer(
            duration: widget.duration,
            curve: widget.curve,
            width: widget.showSubView
                ? constraints.maxWidth * (widget.subViewFlex / _totalFlex)
                : 0,
            child: widget.subViewChild,
          ),
        ],
      );
    });
  }
}
