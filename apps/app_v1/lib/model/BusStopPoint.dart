import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'BusStop.dart';

class BusStopPoint {
  BusStop _busStop;
  LatLng _splitterCoordinate;

  // Constructor
  BusStopPoint(this._busStop, this._splitterCoordinate);

  // Getter for busStop
  BusStop get busStop => _busStop;

  // Setter for busStop
  set busStop(BusStop value) {
    _busStop = value;
  }

  // Getter for splitterCoordinate
  LatLng get splitterCoordinate => _splitterCoordinate;

  // Setter for splitterCoordinate
  set splitterCoordinate(LatLng value) {
    _splitterCoordinate = value;
  }
}
