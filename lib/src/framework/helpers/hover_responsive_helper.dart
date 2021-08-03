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
}
