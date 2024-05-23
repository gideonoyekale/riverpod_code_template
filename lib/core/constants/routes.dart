import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/views/index/index.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // dynamic data = settings.arguments;
    switch (settings.name) {
      case AppIndex.path:
        return MaterialPageRoute(
          builder: (context) => const AppIndex(),
          settings: settings,
        );


      //Default Route is error route
      default:
        return CupertinoPageRoute(
          builder: (context) => errorView(settings.name ?? 'Unknown'),
        );
    }
  }

  static String initialRoute(String state) {
    return AppIndex.path;
  }

  static List<Route> generateInitialRoute(String state) {
    return <Route<dynamic>>[
      MaterialPageRoute<Widget>(builder: (BuildContext context) {
        return const AppIndex();
      }),
    ];
  }

  static Widget errorView(String name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
