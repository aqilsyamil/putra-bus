import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'package:app/features/bus_stop/presentation/BusStopController.dart';

class BusStopWidget extends StatefulWidget {
  const BusStopWidget({super.key});

  @override
  _BusStopWidgetState createState() => _BusStopWidgetState();
}

class _BusStopWidgetState extends State<BusStopWidget> {
  final List<BusStop> busStops = [];
  final BusStopController _busStopController = BusStopController();

  @override
  void initState() {
    super.initState();
    BusStopController().getBusStops().then((value) {
      setState(() {
        busStops.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        body: busStops.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
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
