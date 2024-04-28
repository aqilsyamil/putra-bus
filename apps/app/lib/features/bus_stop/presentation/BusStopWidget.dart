import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'package:app/features/bus_stop/presentation/BusStopController.dart';
import 'package:app/dialogs/ImageDialog.dart';

class BusStopWidget extends StatefulWidget {
  const BusStopWidget({Key? key}) : super(key: key);

  @override
  _BusStopWidgetState createState() => _BusStopWidgetState();
}

class _BusStopWidgetState extends State<BusStopWidget> {
  final List<BusStop> busStops = [];
  final BusStopController _busStopController = BusStopController();
  bool _isLoading = true; // Track loading state
  String _error = ''; // Track error message if any

  @override
  void initState() {
    super.initState();
    _loadBusStops();
  }

  Future<void> _loadBusStops() async {
    try {
      final List<BusStop> fetchedBusStops =
          await _busStopController.getBusStops();

      setState(() {
        busStops.addAll(fetchedBusStops);
        _isLoading = false; // Update loading state
      });
    } catch (error) {
      setState(() {
        _isLoading = false; // Update loading state
        _error = 'Failed to load bus stops: $error'; // Set error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Stops App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[800], // Change app bar color to maroon
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bus Stops',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold, // Change app bar text color to white
            ),
          ),
        ),
        body: busStops.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: busStops.length,
                itemBuilder: (context, index) {
                  final busStop = busStops[index];
                  return ListTile(
                    title: Text(busStop.long_name),
                    subtitle: Text(busStop.short_name),
                    leading: GestureDetector(
                      onTap: () {
                        showImageDialog(
                            context,
                            busStop
                                .image_path); // Call the function from ImageDialog.dart
                      },
                      child: Icon(Icons.info),
                    ),
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
