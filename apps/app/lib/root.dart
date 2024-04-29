import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RootScreen({required this.page, super.key});

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab root'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[page],
        ),
      ),
    );
  }
}
