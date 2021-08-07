import 'package:flutter/widgets.dart';

import 'hover_responsive_state.dart';

class HoverResponsiveHelper {
  HoverResponsiveHelper(
    this.context, {
    this.breakpointForPhones,
    this.breakpointForTablets,
  }) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
  }

  final BuildContext context;
  late final Size screenSize;
  late final double screenWidth;
  late final double screenHeight;

  /// The screen width at which the view for tablets is rendered.
  final double? breakpointForTablets;

  static const double defaultBreakpointForTablets = 768;

  /// The screen width at which the view for mobile phones is rendered.
  final double? breakpointForPhones;

  static const double defaultBreakpointForPhones = 575;

  bool get onDesktop =>
      screenWidth > (breakpointForTablets ?? defaultBreakpointForTablets);

  bool get onTablet {
    final abovePhoneWidth =
        screenWidth > (breakpointForPhones ?? defaultBreakpointForPhones);

    final belowDesktopWidth =
        screenWidth <= (breakpointForTablets ?? defaultBreakpointForTablets);

    return abovePhoneWidth && belowDesktopWidth;
  }

  bool get onPhone => !onDesktop && !onTablet;

  HoverResponsiveState get responsiveState {
    if (onDesktop)
      return HoverResponsiveState.desktop;
    else if (onTablet)
      return HoverResponsiveState.tablet;
    else {
      assert(onPhone);
      return HoverResponsiveState.phone;
    }
  }

  /// Returns a value that is equal to the screen height clamped
  /// between `lowerLimit` and `upperLimit`.
  ///
  /// The screen height is multiplied by `scale` if it is provided before
  /// it is clamped. This is useful for scenarios where you want to
  /// calculate a percentage (scale) of the screen height but limit it
  /// between `lowerLimit` and `upperLimit`.
  double clampedScreenHeight({
    double? lowerLimit,
    double? upperLimit,
    double? scale,
  }) {
    return (screenHeight * (scale ?? 1.0)).clamp(
      lowerLimit ?? 0,
      upperLimit ?? screenHeight,
    );
  }

  /// Returns a value that is equal to the screen width clamped
  /// between `lowerLimit` and `upperLimit`.
  ///
  /// The screen width is multiplied by `scale` if it is provided before
  /// it is clamped. This is useful for scenarios where you want to
  /// calculate a percentage (scale) of the screen width but limit it
  /// between `lowerLimit` and `upperLimit`.
  double clampedScreenWidth({
    double? lowerLimit,
    double? upperLimit,
    double? scale,
  }) {
    return (screenWidth * (scale ?? 1.0)).clamp(
      lowerLimit ?? 0,
      upperLimit ?? screenWidth,
    );
  }
}
