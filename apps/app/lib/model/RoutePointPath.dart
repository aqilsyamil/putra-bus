import 'BusStopPoint.dart';
import 'DrawnPath.dart';

class RoutePointPath {
  String _routePointPathID;
  BusStopPoint _fromBusStop;
  BusStopPoint _toBusStop;
  List<DrawnPath> _drawnPaths;

  // Constructor
  RoutePointPath({
    required String routePointPathID,
    required BusStopPoint fromBusStop,
    required BusStopPoint toBusStop,
    required List<DrawnPath> drawnPaths,
  })  : _routePointPathID = routePointPathID,
        _fromBusStop = fromBusStop,
        _toBusStop = toBusStop,
        _drawnPaths = drawnPaths;

  // Getters
  String get routePointPathID => _routePointPathID;

  BusStopPoint get fromBusStop => _fromBusStop;

  BusStopPoint get toBusStop => _toBusStop;

  List<DrawnPath> get drawnPaths => _drawnPaths;

  // Setters
  set routePointPathID(String value) {
    _routePointPathID = value;
  }

  set fromBusStop(BusStopPoint value) {
    _fromBusStop = value;
  }

  set toBusStop(BusStopPoint value) {
    _toBusStop = value;
  }

  set drawnPaths(List<DrawnPath> value) {
    _drawnPaths = value;
  }
}