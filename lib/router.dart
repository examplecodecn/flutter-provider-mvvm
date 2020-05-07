import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_mvvm/route_paths.dart';
import 'package:flutter_provider_mvvm/views/home.dart';
import 'package:flutter_provider_mvvm/views/login.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('没有找到对应的页面：${settings.name}'),
                  ),
                ));
    }
  }

}
