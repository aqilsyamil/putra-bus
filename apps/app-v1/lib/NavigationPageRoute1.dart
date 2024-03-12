import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'BitMapDescriptor.dart';
import 'package:geolocator/geolocator.dart';

class NavigationPageRoute1 extends StatefulWidget {
  @override
  _NavigationPageRoute1State createState() => _NavigationPageRoute1State();
}

class _NavigationPageRoute1State extends State<NavigationPageRoute1> {
  late GoogleMapController mapController;

  late Position _currentPosition;
  bool _serviceEnabled = false;

  final List<BusStop> busStopsRoute1 = [
    BusStop(
      id: 'SJ100-1',
      name: 'PFC',
      position: LatLng(2.991720962366472, 101.707556203837),
    ),
    BusStop(
      id: 'SJ162-1',
      name: 'KTAG',
      position: LatLng(2.9906065922278406, 101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-1',
      name: 'K14',
      position: LatLng(2.9928782265949017, 101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ832-1',
      name: 'IBS',
      position: LatLng(2.9997608272333394, 101.72158870448789), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-1',
      name: 'FBMK',
      position: LatLng(2.9999843428909356, 101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-1',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-1',
      name: 'FS',
      position: LatLng(3.0007085010742323, 101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-1',
      name: 'PSAS',
      position: LatLng(3.0026803506513735, 101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-1',
      name: 'FSTM',
      position: LatLng(3.004266665826632, 101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-1',
      name: 'Central',
      position: LatLng(3.0012917167440483, 101.70969564394254), // Replace with the actual coordinates
    ),
  ];

  final List<LatLng> roadCoordinatesRoute1 = [
    LatLng(2.991621392694718, 101.70760515415567),
    LatLng(2.991520998102801, 101.70761314769751),
    LatLng(2.9907171435228257, 101.70770010942849),
    LatLng(2.9905446607193134, 101.70792385780781),
    LatLng(2.9905097365655955, 101.71045675473334),
    LatLng(2.9905072547116167, 101.7107351014217),
    LatLng(2.9904946736271425, 101.71096985557979),
    LatLng(2.99049980914963, 101.71147818767012),
    LatLng(2.9905916377437958, 101.71179629817112),
    LatLng(2.9916886165838825, 101.71288980308277),
    LatLng(2.9918598643144136, 101.713128386008),
    LatLng(2.991934319839523, 101.71339927698149),
    LatLng(2.991951692801737, 101.71453503098758),
    LatLng(2.9919914024134493, 101.71489539058041),
    LatLng(2.992031112022719, 101.7157875911452),
    LatLng(2.99204352127737, 101.71760430046506),
    LatLng(2.992080749034327, 101.7177061952349),
    LatLng(2.99208571273516, 101.7179547190638),
    LatLng(2.9921973959979273, 101.71807401050168),
    LatLng(2.9931256075864705, 101.71846916343922),
    LatLng(2.996440013231157, 101.7205277417902),
    LatLng(2.9975672469152785, 101.72105776309851),
    LatLng(2.999086804119085, 101.72156207812499),
    LatLng(2.9997640918100563, 101.72167511427119),
    LatLng(3.000510844418602, 101.72162294376237),
    LatLng(3.0012730688401286, 101.72146487994381),
    LatLng(3.0011646580101887, 101.72070279068615),
    LatLng(3.0011863401775227, 101.72055080704506),
    LatLng(3.0008806215873, 101.71918078323695),
    LatLng(3.0008199115020484, 101.7190613675413),
    LatLng(3.0003410640710824, 101.71645475588676),
    LatLng(2.99983507902807, 101.7136022394701),
    LatLng(2.9996889845279076, 101.71331661598855),
    LatLng(2.9996395257454487, 101.71323151466471),
    LatLng(2.9996333294751127, 101.71314245532906),
    LatLng(2.9996990325952884, 101.71307062573325),
    LatLng(2.999772467101826, 101.71305189178614),
    LatLng(3.0000203695270784, 101.71106249342165),
    LatLng(3.0001185557941703, 101.71014185112803),
    LatLng(3.0001542598898303, 101.7095161718703),
    LatLng(3.000186988642652, 101.70696876370917),
    LatLng(3.0006124623528008, 101.70698664021101),
    LatLng(3.0023530348426792, 101.70698664021144),
    LatLng(3.0034211796681416, 101.70705516698143),
    LatLng(3.0042334451045942, 101.70692109286725),
    LatLng(3.004177404041656, 101.70863004951426),
    LatLng(3.0041870229539565, 101.7093114243268),
    LatLng(3.004107556216379, 101.70947057651071),
    LatLng(3.0039353782651155, 101.70959436154261),
    LatLng(3.0036749038770028, 101.70966951674056),
    LatLng(3.0033895382720317, 101.70967643515753),
    LatLng(3.001899530705045, 101.70965419526968),
    LatLng(2.998896976761488, 101.70954317562156),
    LatLng(2.9985806553319065, 101.70950061144056),
    LatLng(2.9962326921026965, 101.70900124582738),
    LatLng(2.995365191139604, 101.70876716817361),
    LatLng(2.9950547235768026, 101.70839058310906),
    LatLng(2.99502355585406, 101.70761552599876),
    LatLng(2.9950287504742055, 101.70744907081766),
    LatLng(2.994794992534458, 101.7072826155674),
    LatLng(2.993454643132772, 101.70724046748276),
    LatLng(2.9921930156259755, 101.70754115147894),
    LatLng(2.9920069415350716, 101.7075644424967),
    LatLng(2.991754412373068, 101.70760104265666),
    LatLng(2.991621392694718, 101.70760515415567),
  ];

  Set<Marker> _markers = Set<Marker>();

  Set<Polyline> _polylines = Set<Polyline>();

  @override
  void initState() {
    super.initState();
    _initializeRouteData();
    _checkLocationService();
  }

  Future<void> _checkLocationService() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return;
    }

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _updateLocationMarker(_currentPosition);
  }

  void _updateLocationMarker(Position position) {
    // Remove previous marker if exists
    _markers.removeWhere((marker) => marker.markerId.value == 'live_location');

    // Add new marker with updated live location data
    _markers.add(Marker(
      markerId: MarkerId('live_location'),
      position: LatLng(position.latitude, position.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    // Refresh map to reflect changes
    if (mounted) {
      setState(() {});
    }
  }

  void _initializeRouteData() async {
    // Load and resize the bus stop icon
    final customIcon =
    await getResizedMarkerIcon('assets/images/bus_stop_marker.png', 80, 80);

    // Add bus stop markers with the resized icon
    _markers.addAll(busStopsRoute1.map((busStop) {
      return Marker(
        markerId: MarkerId(busStop.id),
        position: busStop.position,
        icon: customIcon,
        infoWindow: InfoWindow(title: busStop.name),
      );
    }));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    for (var i = 0; i < busStopsRoute1.length; i++) {
      mapController.showMarkerInfoWindow(MarkerId(busStopsRoute1[i].id));
    }

    CameraPosition initialPosition = CameraPosition(
      target: LatLng(2.998353514463262, 101.71417772073517),
      zoom: 15.0,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(initialPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Navigation',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(2.998353514463262, 101.71417772073517),
          zoom: 15.0,
        ),
        markers: _markers,
      ),
    );
  }
}

class BusStop {
  final String id;
  final String name;
  final LatLng position;

  BusStop({
    required this.id,
    required this.name,
    required this.position,
  });
}
