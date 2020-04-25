import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/hover_page_base.dart';
import 'core/dependencies/theme/hover_theme.dart';
import 'core/dependencies/helpers/shared_preferences_helper.dart';
import 'core/dependencies/navigation/routing/hover_route.dart';
import 'core/dependencies/navigation/routing/hover_router.dart';
import 'core/dependencies/global_widgets/hover_global_widgets.dart';

class Hover extends StatelessWidget {
  static Future<SharedPreferences> sharedPreferencesInstance() => SharedPreferencesHelper.getInstance();

  static final List<SingleChildWidget> _providers = List();
  static final HoverGlobalWidgets _globalElements = HoverGlobalWidgets();

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

  static HoverThemeData _themeData;

  static void setThemeByName(String themeName) {
    _themeData.setThemeByName(themeName);
  }

  static Future<String> getCurrentThemeName() {
    return _themeData.getCurrentThemeName();
  }

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
      child: _HoverAppBody(
        themeData: _themeData,
      ),
    );
  }
}

class _HoverAppBody extends StatefulWidget {
  final HoverThemeData themeData;
  _HoverAppBody({
    @required this.themeData,
  });
  @override
  _HoverAppBodyState createState() {
    return _HoverAppBodyState();
  }
}

class _HoverAppBodyState extends State<_HoverAppBody> {
  @override
  void initState() {
    super.initState();
    widget.themeData.loadSavedTheme();
  }

  @override
  Widget build(BuildContext context) {
    final _themeData = Provider.of<HoverThemeData>(context, listen: true);
    final _routingManager = Provider.of<HoverRoutingManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData.currentTheme,
      routes: _routingManager.buildRoutes(),
      initialRoute: _routingManager.initialRoute.routeName,
    );
  }
}
