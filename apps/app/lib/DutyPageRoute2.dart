import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'BitMapDescriptor.dart';
class BusStop {
  final String id;
  final String name;

  final LatLng position;
  // Optional parameters with default values
  final String imagePath;
  final bool isStarred;

  BusStop({
    required this.id,
    required this.name,
    required this.position,
    this.imagePath = '',  // Default value
    this.isStarred = false, // Default value
  });
}
class DutyPageRoute2 extends StatefulWidget {
  final String? driverFullName;
  final String? busPlateNumber;

  DutyPageRoute2({this.driverFullName, this.busPlateNumber});
  @override
  _DutyPageRoute2State createState() => _DutyPageRoute2State();
}

class _DutyPageRoute2State extends State<DutyPageRoute2> {
  late GoogleMapController mapController;
  String? selectedButton;
  bool _isSatelliteView = false;
  GoogleMapController? _googleMapController;

  final List<BusStop> busStopsRoute2 = [
    BusStop(
      id: 'SJ163-2',
      name: 'SFC',
      position: LatLng(2.9921172880176776, 101.71541414629283), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ162-2',
      name: 'KTAG',
      position: LatLng(2.9906065922278406, 101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-2',
      name: 'K14',
      position: LatLng(2.9928782265949017, 101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ832-2',
      name: 'IBS',
      position: LatLng(2.9997608272333394, 101.72158870448789), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-2',
      name: 'FBMK',
      position: LatLng(2.9999843428909356, 101.71484887998834), // Replace with the actual coordinates
    ),

    BusStop(
      id: 'SJ155-2',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-2',
      name: 'FS',
      position: LatLng(3.0007085010742323, 101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-2',
      name: 'PSAS',
      position: LatLng(3.0026803506513735, 101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-2',
      name: 'FSTM',
      position: LatLng(3.004266665826632, 101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-2',
      name: 'Central',
      position: LatLng(3.0012917167440483, 101.70969564394254), // Replace with the actual coordinates
    ),
  ];

  List<LatLng> roadCoordinatesRoute2 = [
    LatLng(2.991621392694718, 101.70760515415567), // Starting Bus Stop 1: PFC
    LatLng(2.991520998102801, 101.70761314769751),
    LatLng(2.9907171435228257, 101.70770010942849),
    LatLng(2.9905446607193134, 101.70792385780781),
    LatLng(2.9905097365655955, 101.71045675473334),
    LatLng(2.9905072547116167, 101.7107351014217), // Bus Stop 2: KTAG
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
  }

  void _initializeRouteData() async {
    // Load and resize the bus stop icon
    final customIcon = await getResizedMarkerIcon('assets/images/bus_stop_marker.png', 80, 80);

    // Add bus stop markers with the resized icon
    _markers.addAll(busStopsRoute2.map((busStop) {
      return Marker(
        markerId: MarkerId(busStop.id),
        position: busStop.position,
        icon: customIcon, // Use the resized custom icon
        infoWindow: InfoWindow(title: busStop.name),
      );
    }));

    // Load and resize the bus location icon
    final busLocationIcon = await getResizedMarkerIcon('assets/images/bus_location_tracker.png', 60, 60);

    // Add the bus location marker with the resized icon
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('bus_location'),
        position: LatLng(3.001863433628344, 101.70699124463405),
        icon: busLocationIcon,
      ));
    });


    _polylines.add(Polyline(
      polylineId: PolylineId('route2'),
      points: roadCoordinatesRoute2,
      color: Colors.green,
      width: 5,
    ));
  }

  void _showEndDutyConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("End Duty"),
          content: Text("Are you sure to end duty now?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                // Define the action to take when "OK" is pressed
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    CameraPosition initialPosition = CameraPosition(
      target: LatLng(2.998353514463262, 101.71417772073517),
      zoom: 15.0,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(initialPosition));
  }

  void _animateToRoute2() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(2.998353514463262, 101.71417772073517),
        zoom: 15.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        backgroundColor: Color(0xFF00D161),
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.0), // Add left padding
              child: Text(
                'Duty',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: _showEndDutyConfirmationDialog,
              child: Text(
                'End Duty',
                style: TextStyle(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
        actions: [SizedBox(width: 20)],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 40.0),
            child: TextButton( // Change to TextButton
              onPressed: _animateToRoute2, // Call the animation function
              child: Text(
                'Route 2',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(2.998353514463262, 101.71417772073517),
                zoom: 15.0,
              ),
              markers: _markers,
              polylines: _polylines,
              mapType: _isSatelliteView ? MapType.satellite : MapType.normal,
              myLocationEnabled: false,
            ),
          ),
          Container(
            width: double.infinity,
            height: 350,
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.driverFullName != null)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.driverFullName!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          widget.busPlateNumber ?? "N/A", // Display bus plate number
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: 10),

                Text(
                  'Current bus occupancy',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16, // Adjust the font size as needed
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 10),// Add some spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Low';
                        });
                      },
                      child: Text('Low',
                        style: TextStyle(
                          color: Colors.white, // White text color
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedButton == 'Low' ? Colors.green : Colors.green.withOpacity(0.3),
                        minimumSize: Size(120, 190),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Reduced border radius
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Medium';
                        });
                      },
                      child: Text('Medium',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedButton == 'Medium' ? Colors.yellow : Colors.yellow.withOpacity(0.3),
                        minimumSize: Size(120, 190),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Reduced border radius
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 'High';
                        });
                      },
                      child: Text('High',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedButton == 'High' ? Colors.red : Colors.red.withOpacity(0.3),
                        minimumSize: Size(120, 190),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Reduced border radius
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 0.0, right: 0.0, bottom: 310.0, left: 0.0), // Adjust top and right padding
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isSatelliteView = !_isSatelliteView;
            });
          },
          child: Icon(_isSatelliteView ? Icons.map : Icons.public),
          backgroundColor: Colors.white,
          mini: false,
          shape: CircleBorder(),
        ),
      ),
    );
  }
}