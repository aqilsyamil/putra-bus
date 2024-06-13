import 'package:app/src/features/bus_stop/domain/bus_stop.dart';
import 'package:app/src/features/navigation/domain/waylink.dart';
import 'package:equatable/equatable.dart';

import 'coordinate.dart';

class Link extends Equatable {
  const Link(
      {required this.id,
      required this.name,
      required this.startBusStop,
      required this.endBusStop,
      required this.waylinks});

  final String id;
  final String name;
  final BusStop startBusStop;
  final BusStop endBusStop;
  final List<Waylink> waylinks;

  @override
  get props => [id, name, startBusStop, endBusStop, waylinks];

  @override
  bool get stringify => true;

  factory Link.fromMap(Map<dynamic, dynamic> value) {
    final String id = value['id'].toString();
    final String name = value['name'] as String;
    final String startBusStopId = value['start_bus_stop_id'] as String;
    final String endBusStopId = value['end_bus_stop_id'] as String;
    final List<Waylink> waylinks = value['waylinks']
        .map<Waylink>((dynamic value) => Waylink.fromMap(value));

    return Link(
        id: id,
        name: name,
        startBusStop: BusStop(
            id: startBusStopId,
            fullName: '',
            shortName: '',
            position: const Coordinate(0, 0),
            imagePath: ''),
        endBusStop: BusStop(
            id: endBusStopId,
            fullName: '',
            shortName: '',
            position: const Coordinate(0, 0),
            imagePath: ''),
        waylinks: waylinks);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'start_bus_stop_id': startBusStop.id,
      'end_bus_stop_id': endBusStop.id,
      'waylinks': waylinks
    };
  }
}
