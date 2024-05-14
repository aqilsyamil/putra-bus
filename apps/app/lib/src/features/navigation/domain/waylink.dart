import 'dart:math';

import 'package:app/src/features/navigation/domain/coordinate.dart';
import 'package:equatable/equatable.dart';

class Waylink extends Equatable {
  const Waylink({
    required this.id,
    required this.startWaypoint,
    required this.endWaypoint,
  });

  final String id;
  final Coordinate startWaypoint;
  final Coordinate endWaypoint;

  @override
  get props => [id, startWaypoint, endWaypoint];

  @override
  bool get stringify => true;

  factory Waylink.fromMap(Map<dynamic, dynamic> value) {
    final String id = value['id'].toString();
    final double startWaypointLatitude =
        value['start_waypoint_latitude'] as double;
    final double startWaypointLongitude =
        value['start_waypoint_longitude'] as double;
    final double endWaypointLatitude = value['end_waypoint_latitude'] as double;
    final double endWaypointLongitude =
        value['end_waypoint_longitude'] as double;

    return Waylink(
        id: id,
        startWaypoint:
            Coordinate(startWaypointLatitude, startWaypointLongitude),
        endWaypoint: Coordinate(endWaypointLatitude, endWaypointLongitude));
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start_waypoint_latitude': startWaypoint.latitude,
      'start_waypoint_longitude': startWaypoint.longitude,
      'end_waypoint_latitude': endWaypoint.latitude,
      'end_waypoint_longitude': endWaypoint.longitude
    };
  }
}
