import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'hover_route.dart';

abstract class HoverRoutingManager {
  Future goToInitialPage(BuildContext context);
  Future goToPage<T>(BuildContext context);
  Future<void> pop(BuildContext context);
  void buildRoutes();
}

class HoverRouter implements HoverRoutingManager {
  final List<HoverRoute> routes;
  HoverRoute _currentRoute;
  HoverRoute get initialRoute => routes[0];
  HoverRoute get currentRoute => _currentRoute;

  HoverRouter({
    @required this.routes,
  }) {
    _currentRoute = initialRoute;
  }

  @override
  Future goToInitialPage(BuildContext context) async {
    return _navigate(context, initialRoute);
  }

  @override
  Future goToPage<T>(BuildContext context) async {
    routes.forEach((page) {
      if (page.runtimeType == T) {
        return _navigate(context, page);
      }
      return null;
    });
    return null;
  }

  Future _navigate(BuildContext context, HoverRoute targetPage) async {
    _currentRoute = targetPage;
    return Navigator.popAndPushNamed(context, targetPage.routeName);
  }

  Future<void> pop(BuildContext context) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  Map<String, Widget Function(BuildContext)> buildRoutes() {
    final Map<String, Widget Function(BuildContext)> _routes = Map();

    for (HoverRoute page in routes) {
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