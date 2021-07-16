import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// Global builders that will be reused throughout the app.
/// Use provider to pass the global elements to HoverPage widgets.
class HoverGlobalWidgets {
  HoverGlobalWidgets({
    this.appBarBuilder,
    this.drawerBuilder,
    this.fabBuilder,
  });

  /// Builder for the app bar that will be displayed
  /// on all app pages.
  final Widget Function(BuildContext)? appBarBuilder;

  /// Builder for the drawer that will be displayed
  /// on all app pages.
  final Widget Function(BuildContext)? drawerBuilder;

  /// Builder for the floating action button that will be displayed
  /// on all app pages.
  final Widget Function(BuildContext)? fabBuilder;
}

/// Provider class used by
class HoverGlobalWidgetsProvider extends Provider<HoverGlobalWidgets> {
  HoverGlobalWidgetsProvider(HoverGlobalWidgets globalBuilders)
      : super(create: (_) => globalBuilders);
}
