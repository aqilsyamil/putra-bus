import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusStop {
  final int id;
  final String longName;
  final String shortName;

  BusStop({required this.id, required this.longName, required this.shortName});
}