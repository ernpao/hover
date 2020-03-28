import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'hover_framework.dart';

class HoverApp extends StatelessWidget {
  static final List<SingleChildWidget> _providers = List();
  static HoverRouter _router;
  static ThemeData _theme;
  static final HoverGlobalWidgets _globalElements = HoverGlobalWidgets();

  HoverApp({
    @required List<HoverRoute> routes,
    @required ThemeData theme,
    List<SingleChildWidget> providers,
    AppBar globalAppBar,
    Drawer globalDrawer,
    SnackBar globalSnackBar,
    Widget globalFloatingActionButton,
  }) {
    _theme = theme;
    _router = HoverRouter(appPages: routes);

    _providers.add(HoverRouterProvider(_router));

    _globalElements.appBar = globalAppBar;
    _globalElements.drawer = globalDrawer;
    _globalElements.snackBar = globalSnackBar;
    _globalElements.floatingActionButton = globalFloatingActionButton;
    _providers.add(HoverGlobalWidgetsProvider(_globalElements));

    if (providers != null) {
      _providers.addAll(providers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        initialRoute: _router.appPages[0].routeName,
        routes: _router.buildRoutes(),
        debugShowCheckedModeBanner: false,
        theme: _theme,
      ),
    );
  }
}
