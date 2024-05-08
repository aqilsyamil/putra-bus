//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusStop {
  final String id;
  // final String bus_stop_id;
  final String long_name;
  final String short_name;
  final LatLng position;
  final String image_path;

  BusStop(
      {required this.id,
      // required this.bus_stop_id,
      required this.long_name,
      required this.short_name,
      required this.position,
      required this.image_path});

  factory BusStop.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String id,
        "full_name": String long_name,
        "short_name": String short_name,
        "latitude": double latitude,
        "longitude": double longitude,
        "image_path": String image_path
      } =>
        BusStop(
            id: id,
            long_name: long_name,
            short_name: short_name,
            position: LatLng(latitude, longitude),
            image_path: image_path),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
