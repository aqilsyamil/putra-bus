import 'package:flutter/material.dart';z
import 'package:app/features/busstop/application/BusStopService.dart';
import 'package:app/features/bus_stop/data/BusStopRepository.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'package:app/features/bus_stop/presentation/BusStopController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Stop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final BusStopService busStopService = BusStopService(repository: MockBusStopRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Stops'),
      ),
      body: FutureBuilder<List<BusStop>>(
        future: busStopService.getBusStops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return BusStopController(busStops: snapshot.data!);
          }
        },
      ),
    );
  }
}