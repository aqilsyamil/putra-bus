import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusStop {
  final int id;
  final String long_name;
  final String short_name;

  BusStop({required this.id, required this.long_name, required this.short_name});
}