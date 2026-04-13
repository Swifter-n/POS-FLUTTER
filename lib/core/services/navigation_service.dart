import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  static Future<T?>? push<T>(Widget page) {
    return navigator?.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  static void pop<T>([T? result]) {
    navigator?.pop<T>(result);
  }
}