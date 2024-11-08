import 'package:demo_bloc/core/resouces/navigation_history_observer.dart';
import 'package:flutter/cupertino.dart';

class NavigatorUtil {
  static final GlobalKey<NavigatorState> navigate = GlobalKey<NavigatorState>();
  static final NavigationHistoryObserver _historyObserver =
      NavigationHistoryObserver();

  static Future<T?> pushToPage<T>(
    Widget page, {
    RouteSettings? setting,
    bool fullscreenDialog = false,
  }) async {
    if (navigate.currentState != null) {
      return await Navigator.push(
        navigate.currentState!.context,
        CupertinoPageRoute(
          fullscreenDialog: fullscreenDialog,
          builder: (_) => page,
          settings: setting ??
              RouteSettings(
                name: page.runtimeType.toString(),
              ),
        ),
      );
    } else {
      throw 'not had current state';
    }
  }

  static Future<T?> pushReplaceToPage<T>(Widget page) async {
    if (navigate.currentState != null) {
      return await Navigator.pushReplacement(
        navigate.currentState!.context,
        CupertinoPageRoute(
          builder: (_) => page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
          ),
        ),
      );
    } else {
      throw 'not had current state';
    }
  }

  static pop([dynamic data]) {
    if (navigate.currentState != null) {
      Navigator.pop(navigate.currentState!.context, data);
    } else {
      throw 'not had current state';
    }
  }

  static popToFirstAndReplace(Widget page) {
    if (navigate.currentState != null) {
      Navigator.popUntil(navigate.currentState!.context, (r) => r.isFirst);
      Navigator.pushReplacement(
        navigate.currentState!.context,
        CupertinoPageRoute(
          builder: (_) => page,
        ),
      );
    } else {
      throw 'not had current state';
    }
  }

  static popUntil(String pageName) {
    if (!NavigationHistoryObserver().isScreenInStack(pageName)) {
      return;
    }

    if (navigate.currentState != null) {
      Navigator.popUntil(
        navigate.currentState!.context,
        (r) {
          return r.settings.name == pageName;
        },
      );
    } else {
      throw 'not had current state';
    }
  }

  static popToFirst() {
    if (navigate.currentState != null) {
      Navigator.popUntil(navigate.currentState!.context, (r) => r.isFirst);
    } else {
      throw 'not had current state';
    }
  }
}
