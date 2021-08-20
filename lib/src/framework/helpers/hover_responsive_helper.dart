import 'package:flutter/widgets.dart';

import 'hover_responsive_state.dart';

class HoverResponsiveHelper {
  HoverResponsiveHelper(
    this.context, {
    this.breakpointForPhones,
    this.breakpointForTablets,
  }) {
    assert((breakpointForTablets ?? defaultTabletBreakpoint) >
        (breakpointForPhones ?? defaultPhoneBreakpoint));
    screenSize = _mediaQuery.size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
  }

  final BuildContext context;
  late final Size screenSize;
  late final double screenWidth;
  late final double screenHeight;

  late final _mediaQuery = MediaQuery.of(context);

  /// The maximum screen width at which the view for tablets is rendered.
  /// `onTablet` will return false if the screen width is higher than this value.
  final double? breakpointForTablets;

  static const double defaultTabletBreakpoint = 768;

  /// The maximum screen width at which the view for mobile phones is rendered.
  /// `onPhone` will return false if the screen width is higher than this value.
  final double? breakpointForPhones;

  static const double defaultPhoneBreakpoint = 575;

  bool get onDesktop {
    return screenWidth > (breakpointForTablets ?? defaultTabletBreakpoint);
  }

  bool get onTablet {
    final isLargerThanPhone =
        screenWidth > (breakpointForPhones ?? defaultPhoneBreakpoint);

    final isSmallerThanDesktop =
        screenWidth <= (breakpointForTablets ?? defaultTabletBreakpoint);

    return isLargerThanPhone && isSmallerThanDesktop;
  }

  bool get onPhone {
    return !onDesktop && !onTablet;
  }

  bool get onMobile => !onDesktop;

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

  bool get inPortraitMode {
    return _mediaQuery.orientation == Orientation.portrait;
  }

  bool get inLandscapeMode {
    return _mediaQuery.orientation == Orientation.landscape;
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
