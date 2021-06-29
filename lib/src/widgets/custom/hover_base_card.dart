import 'package:flutter/material.dart';

class HoverBaseCard extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget? child;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double? elevation;

  /// Sets the corner radius of the card.
  final double? cornerRadius;

  /// The card's background color
  final Color? color;

  /// Left margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double? leftMargin;

  /// Top margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double? topMargin;

  /// Right margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double? rightMargin;

  /// Bottom margin of the card. Overridden by [margin] if
  /// [margin] is set.
  final double? bottomMargin;

  /// Sets the margin for all sides of the card. If this is set it
  /// will override any values set for [leftMargin], [topMargin], [rightMargin],
  /// or [bottomMargin].
  final double? margin;

  /// Left padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double? leftPadding;

  /// Top padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double? topPadding;

  /// Right padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double? rightPadding;

  /// Bottom padding of the card. Overridden by [padding] if
  /// [padding] is set.
  final double? bottomPadding;

  /// Sets the padding for all sides of the card. If this is set it
  /// will override any values set for [leftPadding], [topPadding], [rightPadding],
  /// or [bottomPadding].
  final double? padding;

  HoverBaseCard({
    this.child = const SizedBox.shrink(),
    this.elevation,
    this.cornerRadius,
    this.color: Colors.white,
    this.margin,
    this.leftMargin,
    this.topMargin,
    this.rightMargin,
    this.bottomMargin,
    this.padding,
    this.leftPadding,
    this.topPadding,
    this.bottomPadding,
    this.rightPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: margin != null
          ? EdgeInsets.all(margin!)
          : EdgeInsets.only(
              top: topMargin ?? 12.0,
              left: leftMargin ?? 12.0,
              right: rightMargin ?? 12.0,
              bottom: bottomMargin ?? 12.0,
            ),
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius ?? 24.0),
      ),
      child: Padding(
        padding: padding != null
            ? EdgeInsets.all(padding!)
            : EdgeInsets.only(
                left: leftPadding ?? 16.0,
                top: topPadding ?? 16.0,
                right: rightPadding ?? 16.0,
                bottom: bottomPadding ?? 16.0,
              ),
        child: child,
      ),
    );
  }
}
