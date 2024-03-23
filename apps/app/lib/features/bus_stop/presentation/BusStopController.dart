import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'package:app/features/bus_stop/data/BusStopRepository.dart';

class BusStopController {
  List<BusStop> getBusStops() {
    return BusStopRepository.getBusStops();
  }

}
