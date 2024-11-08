import 'package:flutter/material.dart';

class NavigationHistoryObserver extends NavigatorObserver {
  static final NavigationHistoryObserver _singleton =
      NavigationHistoryObserver._internal();

  List<Route<dynamic>> routeStack = [];

  factory NavigationHistoryObserver() {
    return _singleton;
  }

  NavigationHistoryObserver._internal();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    routeStack.removeLast();
    if (newRoute != null) {
      routeStack.add(newRoute);
    }
  }

  bool isScreenInStack(String routeName) {
    return routeStack.any((route) => route.settings.name == routeName);
  }
}
