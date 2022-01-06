import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {Map<String, dynamic>? queryParams, Object? arguments}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName).toString();
    }

    if (arguments != null) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } else {
      return navigatorKey.currentState!.pushNamed(routeName);
    }
  }

  Future<dynamic> navigateToAndClearStack(String routeName,
      {Map<String, String>? queryParams, Object? arguments}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();
    }

    if(arguments != null) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
          routeName, (Route<dynamic> route) => false,
          arguments: arguments);
    } else {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
          routeName, (Route<dynamic> route) => false);
    }
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  void goBackWithData(dynamic data) {
    return navigatorKey.currentState!.pop(data);
  }
}
