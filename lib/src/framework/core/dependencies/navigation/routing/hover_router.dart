import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'hover_route.dart';

abstract class HoverNavigation {
  Future goToInitialPage(BuildContext context);
  Future goToPage<T>(BuildContext context);
  Future goToRoute(String route, BuildContext context);
  Future<void> pop(BuildContext context);
}

abstract class HoverRoutingManager implements HoverNavigation {
  Map<String, Widget Function(BuildContext)> buildRoutes();
  HoverRoute get initialRoute;
  HoverRoute get currentRoute;
  List<HoverRoute> get routes;
  bool canPop(BuildContext context);
}

class HoverRouter implements HoverRoutingManager {
  final List<HoverRoute> routes;
  HoverRoute _currentRoute;

  @override
  HoverRoute get initialRoute => routes[0];

  @override
  HoverRoute get currentRoute => _currentRoute;

  HoverRouter({
    @required this.routes,
  }) {
    _currentRoute = initialRoute;
  }

  @override
  bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  @override
  Future goToInitialPage(BuildContext context) async {
    return _navigate(context, initialRoute.routeName);
  }

  @override
  Future goToPage<T>(BuildContext context) async {
    routes.forEach((page) {
      if (page.runtimeType == T) {
        return _navigate(context, page.routeName);
      }
      return null;
    });
    return null;
  }

  @override
  Future goToRoute(String route, BuildContext context) async {
    _navigate(context, route);
  }

  Future _navigate(BuildContext context, String routeName, {bool usePush: false}) async {
    routes.forEach((page) {
      if (page.routeName == routeName) {
        if (routeName != _currentRoute?.routeName) {
          _currentRoute = page;
          if (usePush) {
            return Navigator.pushNamed(context, page.routeName);
          } else {
            return Navigator.popAndPushNamed(context, page.routeName);
          }
        } else {
          print('Attempted to navigate to $routeName but current route is already ${_currentRoute.routeName}');
        }
      }
      return null;
    });
  }

  @override
  Future<void> pop(BuildContext context) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
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
