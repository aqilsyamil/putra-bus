import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'package:app/features/bus_stop/presentation/BusStopController.dart';

class BusStopWidget extends StatelessWidget {
  final BusStopController _busStopController = BusStopController();

  @override
  Widget build(BuildContext context) {
    final List<BusStop> busStops = _busStopController.getBusStops();

    return MaterialApp(
      title: 'Bus Stops App',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bus Stops'),
        ),
        body: ListView.builder(
          itemCount: busStops.length,
          itemBuilder: (context, index) {
            final busStop = busStops[index];
            return ListTile(
              title: Text(busStop.longName),
              subtitle: Text(busStop.shortName),
              onTap: () {
                // You can perform actions when a bus stop is tapped
              },
            );
          },
        ),
      ),
    );
  }
}