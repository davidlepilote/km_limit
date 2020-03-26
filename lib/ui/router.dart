import 'package:flutter/material.dart';
import 'package:km_limit/ui/permission/permission.dart';

import 'main/home.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final dynamicArguments = routeSettings.arguments;

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

      //case FlappyWebView.routeName:
      //  if (dynamicArguments is FlappyWebViewArguments) {
      //    routeBuilder = (_) => FlappyWebView(url: dynamicArguments.url, title: dynamicArguments.title);
      //  }
      //  break;
    }
    return MaterialPageRoute(builder: routeBuilder);
  }
}
