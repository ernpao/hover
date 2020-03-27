import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'hover_route.dart';

abstract class HoverRoutingManager {
  void goToInitialPage(BuildContext context, {Object data});
  void goToPage<T>(BuildContext context, {Object data});
  void pop(BuildContext context, {Object returnData});
  void buildRoutes();
}

class HoverRouter implements HoverRoutingManager {
  final List<HoverRoute> appPages;
  HoverRoute currentPage;

  HoverRouter({
    @required this.appPages,
  });

  void _closeDrawer(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    if (scaffoldKey.currentState != null &&
        scaffoldKey.currentState.hasDrawer &&
        scaffoldKey.currentState.isDrawerOpen) {
      Navigator.pop(context);
    }
  }

  @override
  void goToInitialPage(BuildContext context, {Object data}) {
    _navigate(context, appPages[0]);
  }

  @override
  void goToPage<T>(
    BuildContext context, {
    Object data,
  }) {
    appPages.forEach((page) {
      if (page.runtimeType == T) {
        _navigate(context, page);
      }
    });
  }

  void _navigate(BuildContext context, HoverRoute page, {Object data}) {
    _closeDrawer(context, page.scaffoldKey);
    Navigator.pushNamed(context, page.routeName, arguments: data);
  }

  void pop(BuildContext context, {Object returnData}) {
    Navigator.pop(context);
  }

  Map<String, Widget Function(BuildContext)> buildRoutes() {
    final Map<String, Widget Function(BuildContext)> _routes = Map();

    for (HoverRoute page in appPages) {
      _routes[page.routeName] = (_) {
        return page;
      };
    }
    return _routes;
  }
}

class HoverRouterProvider extends Provider<HoverRoutingManager> {
  HoverRouterProvider(HoverRoutingManager appNavigationManager) : super(create: (_) => appNavigationManager);
}
