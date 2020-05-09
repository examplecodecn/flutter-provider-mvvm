import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/provider_setup.dart';
import 'package:flutter_provider_mvvm/route_paths.dart';
import 'package:flutter_provider_mvvm/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RoutePaths.LOGIN,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
