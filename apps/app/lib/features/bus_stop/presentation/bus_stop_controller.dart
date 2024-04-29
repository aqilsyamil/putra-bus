// bus_stop_controller.dart
import 'package:app/features/bus_stop/data/bus_stop_repository.dart';
import 'package:app/features/bus_stop/domain/bus_stop.dart';

class BusStopController {
  Future<List<BusStop>> getBusStops() {
    return BusStopRepository.fetchBusStops();
  }
}
