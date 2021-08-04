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

  /// The total width of the card (including the margins).
  final double? width;

  /// The total height of the card (including the margins).
  final double? height;

  HoverBaseCard({
    this.child = const SizedBox.shrink(),
    this.elevation,
    this.cornerRadius,
    this.color,
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
    this.height,
    this.width,
  });

  static const _defaultMargin = 12.0;
  static const _defaultPadding = 16.0;
  static const _defaultCornerRadius = 24.0;

  @override
  Widget build(BuildContext context) {
    Color defaultCardColor = Colors.white;
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.dark) defaultCardColor = Colors.black;

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: color ?? defaultCardColor,
        margin: margin != null
            ? EdgeInsets.all(margin!)
            : EdgeInsets.only(
                top: topMargin ?? _defaultMargin,
                left: leftMargin ?? _defaultMargin,
                right: rightMargin ?? _defaultMargin,
                bottom: bottomMargin ?? _defaultMargin,
              ),
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            cornerRadius ?? _defaultCornerRadius,
          ),
        ),
        child: Padding(
          padding: padding != null
              ? EdgeInsets.all(padding!)
              : EdgeInsets.only(
                  left: leftPadding ?? _defaultPadding,
                  top: topPadding ?? _defaultPadding,
                  right: rightPadding ?? _defaultPadding,
                  bottom: bottomPadding ?? _defaultPadding,
                ),
          child: child,
        ),
      ),
    );
  }
}
