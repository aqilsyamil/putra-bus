// bus_stop_controller.dart
import 'package:app/features/bus_stop/data/BusStopRepository.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';

class BusStopController {
  Future<List<BusStop>> getBusStops() {
    return BusStopRepository.getBusStops();
  }
}
