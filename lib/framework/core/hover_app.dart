import 'package:flutter/material.dart';
import 'navigation/hover_navigation.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'hover_page.dart';

class HoverApp extends StatelessWidget {
  final List<SingleChildWidget> _providers = List();
  final HoverRouter _appNavigationManager;
  final HoverPage _initialPage;
  final ThemeData _appTheme;
  final HoverAppGlobalElements _globalElements = HoverAppGlobalElements();

  factory HoverApp({
    @required List<HoverPage> appPages,
    @required HoverPage initialPage,
    @required ThemeData appTheme,
    List<SingleChildWidget> providers,
    AppBar globalAppBar,
    Drawer globalDrawer,
    SnackBar globalSnackBar,
  }) {
    HoverRouter appNavigationManager = HoverRouter(appPages: appPages, initialPage: initialPage);
    return HoverApp._(
      appNavigationManager,
      appTheme,
      initialPage,
      topLevelProviders: providers,
      globalAppBar: globalAppBar,
      globalDrawer: globalDrawer,
      globalSnackBar: globalSnackBar,
    );
  }

  HoverApp._(
    this._appNavigationManager,
    this._appTheme,
    this._initialPage, {
    List<SingleChildWidget> topLevelProviders,
    AppBar globalAppBar,
    Drawer globalDrawer,
    SnackBar globalSnackBar,
  }) {
    _providers.add(HoverRouterProvider(_appNavigationManager));

    _globalElements.globalAppBar = globalAppBar;
    _globalElements.globalDrawer = globalDrawer;
    _globalElements.globalSnackBar = globalSnackBar;
    _providers.add(_HoverAppGlobalElementsProvider(_globalElements));

    if (topLevelProviders != null) {
      _providers.addAll(topLevelProviders);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        title: _initialPage.title,
        initialRoute: _initialPage.routeName,
        routes: _appNavigationManager.buildRoutes(),
        debugShowCheckedModeBanner: false,
        theme: _appTheme,
      ),
    );
  }
}

// Global components that will be reused throughout the app.
// User provider to pass the global elements to HoverPage widgets.
class HoverAppGlobalElements {
  HoverAppGlobalElements();
  AppBar globalAppBar;
  Drawer globalDrawer;
  SnackBar globalSnackBar;
}

class _HoverAppGlobalElementsProvider extends Provider<HoverAppGlobalElements> {
  _HoverAppGlobalElementsProvider(HoverAppGlobalElements globalElements) : super(create: (_) => globalElements);
}
