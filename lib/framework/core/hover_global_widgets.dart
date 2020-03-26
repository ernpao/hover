import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Global components that will be reused throughout the app.
// User provider to pass the global elements to HoverPage widgets.
class HoverGlobalWidgets {
  HoverGlobalWidgets();
  AppBar appBar;
  Drawer drawer;
  SnackBar snackBar;
  Widget floatingActionButton;
}

class HoverGlobalWidgetsProvider extends Provider<HoverGlobalWidgets> {
  HoverGlobalWidgetsProvider(HoverGlobalWidgets globalElements) : super(create: (_) => globalElements);
}
