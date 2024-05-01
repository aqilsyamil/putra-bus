import 'package:app/src/common_widgets/bar/app_bar.dart';
import 'package:flutter/material.dart';

class BusRouteWidget extends StatelessWidget {
  const BusRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Bus Routes'),
      body: Container(
        alignment: Alignment.center,
        child:
            const Text('Bus Routes', style: TextStyle(height: 5, fontSize: 45)),
      ),
    );
  }
}
