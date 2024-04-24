//import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusStop {
  final int id;
  // final String bus_stop_id;
  final String long_name;
  final String short_name;
  // final LatLng position;
  final String image_path;

  BusStop(
    {
    required this.id, 
    // required this.bus_stop_id,
    required this.long_name, 
    required this.short_name,
    // required this.position,
    required this.image_path
    });
}
