import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'hover_framework.dart';

class Hover extends StatelessWidget {
  static final List<SingleChildWidget> _providers = List();
  static final HoverGlobalWidgets _globalElements = HoverGlobalWidgets();

  static HoverThemeData _themeData;

  static HoverRoutingManager _router;
  static HoverRoutingManager get router => _router;
  static bool navigationCanPop(BuildContext context) => router?.canPop(context) == true;

  static Hover _instance;
  static Hover get instance => _instance;

  static HoverPageBase get currentPage => _router.currentRoute as HoverPageBase;

  static get isDrawerOpen => currentPage.scaffoldKey.currentState.isDrawerOpen;

  static void closeDrawer() => currentPage.closeDrawer();

  static void openDrawer() => currentPage.openDrawer();

  static void toggleDrawer() => currentPage.toggleDrawer();

  static void setThemeByName(String themeName) {
    _themeData.setThemeByName(themeName);
  }

  static String get currentThemeName => _themeData.currentThemeName;
  static ThemeData get currentTheme => _themeData.currentTheme;

  ///
  /// Use this to create an using with Hover. This method
  /// returns a stateless widget with a build method that creates a MaterialApp
  /// widget nested inside a MultiProvider.
  ///
  static Hover create({
    @required List<HoverRoute> routes,
    @required Map<String, ThemeData> themes,
    List<SingleChildWidget> providers,
    AppBar globalAppBar,
    Drawer globalDrawer,
    SnackBar globalSnackBar,
    Widget globalFloatingActionButton,
  }) {
    if (_instance == null) {
      _instance = Hover._(
        routes: routes,
        themes: themes,
        providers: providers,
        appBar: globalAppBar,
        drawer: globalDrawer,
        snackBar: globalSnackBar,
        floatingActionButton: globalFloatingActionButton,
      );
    }

    return _instance;
  }

  Hover._({
    @required List<HoverRoute> routes,
    @required Map<String, ThemeData> themes,
    List<SingleChildWidget> providers,
    AppBar appBar,
    Drawer drawer,
    SnackBar snackBar,
    Widget floatingActionButton,
  }) {
    _router = HoverRouter(routes: routes);
    _providers.add(HoverRouterProvider(_router));

    _themeData = HoverThemeData(themes: themes);
    _providers.add(HoverThemeProvider(_themeData));

    _globalElements.appBar = appBar;
    _globalElements.drawer = drawer;
    _globalElements.snackBar = snackBar;
    _globalElements.floatingActionButton = floatingActionButton;
    _providers.add(HoverGlobalWidgetsProvider(_globalElements));

    if (providers != null) {
      _providers.addAll(providers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: _HoverAppBody(),
    );
  }
}

class _HoverAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Provider.of<HoverRoutingManager>(context).initialRoute.routeName,
      routes: Provider.of<HoverRoutingManager>(context).buildRoutes(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<HoverThemeData>(context).currentTheme,
    );
  }
}
