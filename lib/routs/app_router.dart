import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instalment/routs/routing_data.dart';
import 'package:instalment/routs/routs_names.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/screens/clients/view/edit_clients_screen.dart';
import 'package:instalment/screens/home/view/home_screen.dart';
import 'package:instalment/screens/not_found_screen/not_found_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    print('settings.name ${settings.name}');

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    switch (routingData.route) {
      case RouteName.HOME:
        return _getPageRoute(HomeScreen(), settings);

      case RouteName.EDIT_CLIENTS:
        var clientArgument = settings.arguments != null
            ? settings.arguments as ClientModel
            : null;
        return _getPageRoute(
            EditClientsScreen(clientArgument == null, clientArgument),
            settings);

      default:
        return _getPageRoute(const NotFoundScreen(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
