import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: Builder(
          builder: (context) => Center(child: Text('APP首页')),
        ));
  }
}