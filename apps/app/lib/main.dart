import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/presentation/BusStopWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BusStopWidget();
  }
}