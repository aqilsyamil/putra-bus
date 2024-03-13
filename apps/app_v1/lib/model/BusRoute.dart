import 'Bus.dart';
import 'RoutePointPath.dart';

class BusRoute {
  String _busRouteID;
  String _busRouteName;
  List<RoutePointPath> _routePointPaths;
  List<Bus> _buses;

  // Constructor
  BusRoute({
    required String busRouteID,
    required String busRouteName,
    required List<RoutePointPath> routePointPaths,
    List<Bus>? buses,
  })  : _busRouteID = busRouteID,
        _busRouteName = busRouteName,
        _routePointPaths = routePointPaths,
        _buses = buses?? [];

  // Getters
  String get busRouteID => _busRouteID;

  String get busRouteName => _busRouteName;

  List<RoutePointPath> get routePointPaths => _routePointPaths;

  List<Bus> get buses => _buses;

  // Setters
  set busRouteID(String value) {
    _busRouteID = value;
  }

  set busRouteName(String value) {
    _busRouteName = value;
  }

  set routePointPaths(List<RoutePointPath> value) {
    _routePointPaths = value;
  }

  set buses(List<Bus> value) {
    _buses = value;
  }
}