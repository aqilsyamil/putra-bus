import 'package:flutter/material.dart';
import '../domain/BusStop.dart'; // Import the BusStop class

class BusStopWidget extends StatelessWidget {
  final BusStop busStop;

  BusStopWidget({required this.busStop});

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