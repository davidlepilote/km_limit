import 'package:flutter/material.dart';

import 'explain/explain.dart';
import 'main/home.dart';
import 'permission/permission.dart';
import 'rules/rules.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {

    Widget Function(BuildContext context) routeBuilder = (context) => Scaffold(
      body: Center(
        child: Text('No route defined for ${routeSettings.name}'),
      ),
    ); // Default route builder

    switch (routeSettings.name) {
      case Permission.routeName :
        routeBuilder = (_) => Permission();
        break;
      case Home.routeName:
        routeBuilder = (_) => Home();
        break;
      case Rules.routeName:
        routeBuilder = (_) => Rules();
        break;
      case Explain.routeName:
        routeBuilder = (_) => Explain();
        break;
    }
    return MaterialPageRoute(builder: routeBuilder);
  }
}
