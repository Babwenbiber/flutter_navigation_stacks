import 'package:flutter/cupertino.dart';

class CustomObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route route, Route previousRoute) {
    print(
        "OBSERVER: pushed ${route.settings.name} over ${previousRoute.settings.name}");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    print(
        "OBSERVER: popped ${previousRoute.settings.name} from ${route.settings.name}");
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    print(
        "OBSERVER: replaced ${oldRoute.settings.name} with ${newRoute.settings.name}");
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
