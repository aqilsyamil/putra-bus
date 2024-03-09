import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawnPath {
  LatLng _subsequentCoordinate;
  LatLng _consequentCoordinate;

  // Constructor
  DrawnPath({
    required LatLng subsequentCoordinate,
    required LatLng consequentCoordinate
  })
      : _subsequentCoordinate = subsequentCoordinate,
        _consequentCoordinate = consequentCoordinate;

  // Getters
  LatLng get subsequentCoordinate => _subsequentCoordinate;

  LatLng get consequentCoordinate => _consequentCoordinate;

  // Setters
  set subsequentCoordinate(LatLng value) {
    _subsequentCoordinate = value;
  }

  set consequentCoordinate(LatLng value) {
    _consequentCoordinate = value;
  }
}