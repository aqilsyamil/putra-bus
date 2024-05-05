import 'package:app/src/common_widgets/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/src/features/bus_stop/domain/bus_stop.dart';
import 'package:app/src/features/bus_stop/presentation/bus_stop_controller.dart';
import 'package:app/src/common_widgets/dialog/image_dialog.dart';

class BusStopScreen extends StatefulWidget {
  const BusStopScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BusStopScreenState createState() => _BusStopScreenState();
}

class _BusStopScreenState extends State<BusStopScreen> {
  final List<BusStop> busStops = [];
  final BusStopController _busStopController = BusStopController();
  bool _isLoading = true; // Track loading state

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
// Set error message
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
                        ImageDialog.of(context)
                            .showImageNetworkDialog(busStop.image_path);
                      },
                      child: const Icon(Icons.info),
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
