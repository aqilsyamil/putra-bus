import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/domain/bus_stop.dart';
import 'package:app/features/bus_stop/presentation/bus_stop_controller.dart';
import 'package:app/components/dialogs/image_dialog.dart';
import 'package:app/components/bars/appbar.dart';
import 'package:app/components/bars/navbar.dart';

class BusStopWidget extends StatefulWidget {
  const BusStopWidget({super.key});

  @override
  _BusStopWidgetState createState() => _BusStopWidgetState();
}

class _BusStopWidgetState extends State<BusStopWidget> {
  final List<BusStop> busStops = [];
  final BusStopController _busStopController = BusStopController();
  bool _isLoading = true; // Track loading state
  String _error = ''; // Track error message if any
  int _selectedIndex =
      0; // Track the selected index for the bottom navigation bar

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Navigate to Bus Stops page (current page)
        break;
      case 1:
        Navigator.pushNamed(context, '/busRoutes');
        break;
      case 2:
        Navigator.pushNamed(context, '/navigation');
        break;
      case 3:
        Navigator.pushNamed(context, '/messages');
        break;
      default:
        break;
    }
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
        appBar: const CustomAppBar(title: 'Bus Stops'), // Use CustomAppBar here
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
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
                      child: const Icon(Icons.info),
                    ),
                    onTap: () {
                      // You can perform actions when a bus stop is tapped
                    },
                  );
                },
              ),
        bottomNavigationBar: Navbar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
