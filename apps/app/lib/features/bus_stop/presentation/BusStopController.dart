import 'package:flutter/material.dart';
import '../domain/BusStop.dart'; // Import the BusStop class
import 'BusStopWidget.dart'; // Import the BusStopWidget class

class BusStopController extends StatelessWidget {
  final List<BusStop> busStops;

  BusStopController({required this.busStops});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: busStops.length,
      itemBuilder: (context, index) {
        final busStop = busStops[index];
        return BusStopWidget(
          busStop: busStop,
        );
      },
    );
  }
}