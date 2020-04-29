import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'hover_route.dart';

/// An interface for routing and navigation.
abstract class HoverNavigation {
  Future<T> navigateTo<T extends Object, TO extends Object>(
    String route,
    BuildContext context, {
    bool push: false,
    TO result,
  });
  void pop<T extends Object>(BuildContext context, [T result]);
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
  Future<T> navigateTo<T extends Object, TO extends Object>(
    String route,
    BuildContext context, {
    bool push: false,
    TO result,
  }) async {
    return _navigate<T, TO>(context, route, usePush: push, result: result);
  }

  Future<T> _navigate<T extends Object, TO extends Object>(
    BuildContext context,
    String routeName, {
    bool usePush: false,
    TO result,
  }) async {
    for (int i = 0; i < routes.length; i++) {
      final route = routes[i];
      if (route.routeName == routeName) {
        _currentRoute = route;
        if (usePush) {
          return Navigator.pushNamed<T>(context, route.routeName);
        } else {
          return Navigator.popAndPushNamed<T, TO>(context, route.routeName, result: result);
        }
      }
    }
    return null;
  }

  @override
  void pop<T extends Object>(BuildContext context, [T result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop<T>(context, result);
    } else {
      print('Can\'t pop the navigation stack.');
    }
  }

  @override
  Map<String, Widget Function(BuildContext)> buildRoutes() {
    final Map<String, Widget Function(BuildContext)> _routes = Map();

    for (HoverRoute page in routes) {
      _routes[page.routeName] = (context) {
        final regenerate = page.regenerate(context);
        return regenerate != null ? regenerate : page;
      };
    }
    return _routes;
  }
}

class HoverRouterProvider extends Provider<HoverRoutingManager> {
  HoverRouterProvider(HoverRoutingManager appNavigationManager) : super(create: (_) => appNavigationManager);
}
