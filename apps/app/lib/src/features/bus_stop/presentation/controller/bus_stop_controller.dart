import 'package:app/src/features/bus_stop/data/bus_stop_repository.dart';
import 'package:app/src/features/bus_stop/domain/bus_stop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bus_stop_controller.g.dart';

class BusStopController {
  BusStopController(this.busStopRepository);

  BusStopRepository busStopRepository;

  Future<List<BusStop>> getBusStops() async {
    return BusStopRepository.fetchBusStops();
  }
}

@Riverpod(keepAlive: true)
Future<List<BusStop>> busStopService(BusStopServiceRef ref) async {
  return await BusStopController(BusStopRepository()).getBusStops();
}
