import 'package:flutter/material.dart';

class HoverBaseCard extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double elevation;

  /// Sets the corner radius of the card.
  final double cornerRadius;

  /// The card's background color
  final Color color;

  /// Left margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double leftMargin;

  /// Top margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double topMargin;

  /// Right margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double rightMargin;

  /// Bottom margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double bottomMargin;

  /// Sets the margin for all sides of the card. If this is set it
  /// will override any values set for [leftMargin], [topMargin], [rightMargin],
  /// or [bottomMargin].
  final double margin;

  /// Left padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double leftPadding;

  /// Top padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double topPadding;

  /// Right padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double rightPadding;

  /// Bottom padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double bottomPadding;

  /// Sets the padding for all sides of the card. If this is set it
  /// will override any values set for [leftPadding], [topPadding], [rightPadding],
  /// or [bottomPadding].
  final double padding;

  HoverBaseCard({
    this.child = const SizedBox.shrink(),
    this.elevation = 2.0,
    this.cornerRadius = 24.0,
    this.color: Colors.white,
    this.margin,
    this.leftMargin = 12,
    this.topMargin = 12,
    this.rightMargin = 12,
    this.bottomMargin = 12,
    this.padding,
    this.leftPadding = 16,
    this.topPadding = 16,
    this.bottomPadding = 16,
    this.rightPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: margin != null
          ? EdgeInsets.all(margin)
          : EdgeInsets.only(
              top: topMargin,
              left: leftMargin,
              right: rightMargin,
              bottom: bottomMargin,
            ),
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Padding(
        padding: padding != null
            ? EdgeInsets.all(padding)
            : EdgeInsets.only(
                left: leftPadding,
                top: topPadding,
                right: rightPadding,
                bottom: bottomPadding,
              ),
        child: child,
      ),
    );
  }
}
