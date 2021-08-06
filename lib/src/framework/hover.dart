import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/global_widgets/hover_global_widgets.dart';
import 'components/navigation/routing/hover_router.dart';
import 'components/theme/hover_theme_data.dart';
import 'components/theme/hover_theme_settings.dart';
import 'hover_page.dart';
import 'helpers/hover_bottom_sheet_helper.dart';
import 'helpers/hover_dimensions_helper.dart';
import 'helpers/hover_drawer_helper.dart';
import 'helpers/hover_shared_preferences_helper.dart';
import 'helpers/hover_snackbar_helper.dart';

class Hover extends StatelessWidget {
  static final List<InheritedProvider> _providers = [];

  // Routing
  static late HoverRoutingManager _router;
  static HoverRoutingManager get router => _router;

  // Drawer
  static bool isDrawerOpen(BuildContext context) =>
      HoverDrawerHelper.isDrawerOpen(context);
  static bool hasDrawer(BuildContext context) =>
      HoverDrawerHelper.hasDrawer(context);
  static void openDrawer(BuildContext context) =>
      HoverDrawerHelper.openDrawer(context);
  static void closeDrawer(BuildContext context) =>
      HoverDrawerHelper.closeDrawer(context);
  static void toggleDrawer(BuildContext context) =>
      HoverDrawerHelper.toggleDrawer(context);

  // Dimensions

  /// Get the screen width of the device. The value can be clamped with the
  /// optional parameters `lowerClamp` and `upperClamp`;
  static double getScreenWidth(
    BuildContext context, {
    double? lowerClamp,
    double? upperClamp,
  }) {
    return HoverDimensionsHelper.getScreenWidth(context).clamp(
      lowerClamp ?? 0.0,
      upperClamp ?? double.maxFinite,
    );
  }

  /// Get the screen height of the device. The value can be clamped with the
  /// optional parameters `lowerClamp` and `upperClamp`;
  static double getScreenHeight(
    BuildContext context, {
    double? lowerClamp,
    double? upperClamp,
  }) {
    return HoverDimensionsHelper.getScreenHeight(context).clamp(
      lowerClamp ?? 0.0,
      upperClamp ?? double.maxFinite,
    );
  }

  static double getScreenWidthWithScale(
    double scale,
    BuildContext context, {
    double? lowerClamp,
    double? upperClamp,
  }) {
    return getScreenWidth(
          context,
          lowerClamp: lowerClamp,
          upperClamp: upperClamp,
        ) *
        scale;
  }

  static double getScreenHeightWithScale(
    double scale,
    BuildContext context, {
    double? lowerClamp,
    double? upperClamp,
  }) {
    return getScreenHeight(
          context,
          lowerClamp: lowerClamp,
          upperClamp: upperClamp,
        ) *
        scale;
  }

  // Theme
  static late HoverThemeSettings _themeSettings;

  /// Get the name of the theme saved on the device.
  static Future<String?> getSavedThemeName() =>
      _themeSettings.getSavedThemeName();

  /// Change the current theme of the app by providing
  /// the name of the desired theme. This also saves
  /// the setting on the device, ensuring that it will
  /// be loaded the next time the app is started.
  static void setThemeByName(String themeName) =>
      _themeSettings.setThemeByName(themeName);

  /// Returns a list of the names of available themes.
  static List<String> getThemeNames() => _themeSettings.themeNames;

  /// Save key/value pair to shared preferences.
  static Future<bool> saveSetting(String key, String value) =>
      HoverSharedPreferencesHelper.saveSetting(key, value);

  /// Load a value from shared preferences referenced by a key.
  static Future<String?> loadSetting(String key) =>
      HoverSharedPreferencesHelper.loadSetting(key);

  /// Helper method for displaying a snackbar widget
  static void showSnackBar(BuildContext context, SnackBar snackBar) {
    HoverSnackBarHelper.showSnackBar(context, snackBar);
  }

  /// Helper method for displaying a simple snackbar
  static void showPlainSnackBar(
    BuildContext context,
    String message, {
    Duration duration: HoverSnackBarHelper.defaultSnackBarDuration,
  }) {
    HoverSnackBarHelper.showPlainSnackBar(context, message, duration: duration);
  }

  /// Helper method for displaying the bottom sheet
  static void showBottomSheet(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    HoverBottomSheetHelper.showBottomDrawer(context, builder);
  }

  ///
  /// Create an app with Hover. This method
  /// returns a stateless widget that contains a
  /// MaterialApp nested inside a MultiProvider.
  ///
  ///
  /// `themes`: A key/value store of themes used by the app.
  /// The current theme can be set by calling setThemeByName.
  /// The app loads the first theme in this Map on startup.
  ///
  /// `appBarBuilder`: Builder for the app bar that will be displayed
  /// on all app pages.
  ///
  /// `drawerBuilder`: Builder for the drawer that will be displayed
  /// on all app pages.
  ///
  /// `fabBuilder`: Builder for the floating action button that will be displayed
  /// on all app pages.
  ///
  factory Hover.create({
    required List<HoverPage> pages,
    required List<HoverThemeData> themes,
    List<InheritedProvider> providers = const [],
    Widget Function(BuildContext)? appBarBuilder,
    Widget Function(BuildContext)? drawerBuilder,
    Widget Function(BuildContext)? fabBuilder,
  }) {
    return Hover._(
      pages: pages,
      themes: themes,
      providers: providers,
      globalWidgets: HoverGlobalWidgets(
        appBarBuilder: appBarBuilder,
        drawerBuilder: drawerBuilder,
        fabBuilder: fabBuilder,
      ),
    );
  }

  Hover._({
    required List<HoverPage> pages,
    required List<HoverThemeData> themes,
    List<InheritedProvider> providers = const [],
    required HoverGlobalWidgets globalWidgets,
  }) {
    _router = HoverRouter(routes: pages);
    _themeSettings = HoverThemeSettings(themes: themes);
    _providers.add(Provider<HoverRoutingManager>.value(value: _router));
    _providers.add(Provider<HoverGlobalWidgets>.value(value: globalWidgets));
    _providers.add(
      ChangeNotifierProvider<HoverThemeSettings>.value(value: _themeSettings),
    );
    _providers.addAll(providers);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _themeSettings.currentTheme.data,
        routes: _router.buildRoutes(),
        initialRoute: _router.initialRoute.routeName,
      ),
    );
  }
}
