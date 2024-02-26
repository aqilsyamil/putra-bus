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
class DutyPageRoute3 extends StatefulWidget {
  final String? driverFullName;
  final String? busPlateNumber;

  DutyPageRoute3({this.driverFullName, this.busPlateNumber});
  @override
  _DutyPageRoute3State createState() => _DutyPageRoute3State();
}

class _DutyPageRoute3State extends State<DutyPageRoute3> {
  late GoogleMapController mapController;
  String? selectedButton;
  bool _isSatelliteView = false;
  GoogleMapController? _googleMapController;

  final List<BusStop> busStopsRoute3 = [
    BusStop(
      id: '111',
      name: 'FRSB',
      position: LatLng(3.003399376837077, 101.72039834803533), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-3',
      name: 'FBMK',
      position: LatLng(2.9999843428909356, 101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-3',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-3',
      name: 'FS',
      position: LatLng(3.0007085010742323, 101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-3',
      name: 'PSAS',
      position: LatLng(3.0026803506513735, 101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-3',
      name: 'FSTM',
      position: LatLng(3.004266665826632, 101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-3',
      name: 'Central',
      position: LatLng(3.0012917167440483, 101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ101-3',
      name: 'KAA',
      position: LatLng(3.0002087160519513, 101.71523932855689), // Replace with the actual coordinates
    ),
    BusStop(
      id: '1111',
      name: 'K10',
      position: LatLng(3.0098003882950177, 101.71972624064571), // Replace with the actual coordinates
    ),

  ];

  List<LatLng> roadCoordinatesRoute3 = [
    LatLng(3.0093538865047247, 101.72009214034568),
    LatLng(3.0101157734443866, 101.71930137344236),
    LatLng(3.0100023009552275, 101.71918542521605),
    LatLng(3.009302939624124, 101.71863583062286),
    LatLng(3.008862943858412, 101.71838306348924),
    LatLng(3.008388211378421, 101.71935007169816),
    LatLng(3.0081705291049845, 101.719918218007),
    LatLng(3.008089769046511, 101.72006386303954),
    LatLng(3.006928410088234, 101.7197507679799),
    LatLng(3.004157288897445, 101.71869689611795),
    LatLng(3.0036423427403927, 101.718524564189),
    LatLng(3.0035385499205116, 101.71849908320343),
    LatLng(3.003490336479989, 101.71853194026376),
    LatLng(3.0034401141438543, 101.718532610816),
    LatLng(3.0033430176194758, 101.71891147283888),
    LatLng(3.0032847305399, 101.71934458206985),
    LatLng(3.0032740164397893, 101.71967315267538),
    LatLng(3.0033302654646694, 101.7200634140858),
    LatLng(3.0033858448581743, 101.7202625681061),
    LatLng(3.0037012411095123, 101.72097067128477),
    LatLng(3.003755481219468, 101.72105717252522),
    LatLng(3.003754120727928, 101.7210610112958),
    LatLng(3.0036940632957787, 101.72097484046687),
    LatLng(3.003375848481385, 101.72025495499703),
    LatLng(3.003289796010455, 101.71987257194365),
    LatLng(3.003266490131738, 101.71966522338656),
    LatLng(3.0032742946755655, 101.71936643441617),
    LatLng(3.0032943059470214, 101.71912287788415),
    LatLng(3.0033291267716424, 101.71893579380595),
    LatLng(3.0034179462709103, 101.71857130994493),
    LatLng(3.003331397046497, 101.71848464167597),
    LatLng(3.0031655110138944, 101.71844672430831),
    LatLng(3.0025722879172534, 101.71845214107508),
    LatLng(3.0019285773840876, 101.71847200255311),
    LatLng(3.0017771160303703, 101.7184557522527),
    LatLng(3.001232576217443, 101.71838352869486),
    LatLng(3.0009621093235688, 101.71838172310466),
    LatLng(3.00084671009157, 101.7183853342825),
    LatLng(3.0007186890600788, 101.71837269515991),
    LatLng(3.000659186322035, 101.7182625542348),
    LatLng(3.0003149731535643, 101.71644342325106),
    LatLng(3.0002986887888468, 101.7161752683438),
    LatLng(3.0000115823288986, 101.71483896409994),
    LatLng(2.9997766568925877, 101.71356585827048),
    LatLng(2.999740381636913, 101.71351396536981),
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
    LatLng(3.001449760030355, 101.7096414321997),
    LatLng(3.0004268680619797, 101.70959379049657),
    LatLng(3.0002875145695573, 101.709762093027),
    LatLng(3.000182170743548, 101.70994083729175),
    LatLng(3.00006147722427, 101.71151866751302),
    LatLng(3.0000175524818973, 101.71204907516292),
    LatLng(2.999834102062915, 101.71310471575566),
    LatLng(2.999870275386367, 101.71315905019783),
    LatLng(2.999867691577596, 101.71323667082955),
    LatLng(2.999813431591846, 101.7133246408788),
    LatLng(2.999836685871775, 101.71350316833167),
    LatLng(2.999859940150928, 101.7136325360574),
    LatLng(3.0002707656728695, 101.71571794369557),
    LatLng(3.0003999560650985, 101.71632597198129),
    LatLng(3.0004387131785815, 101.716393243197),
    LatLng(3.000800446169597, 101.71810607180682),
    LatLng(3.0009063822341115, 101.71819921656486),
    LatLng(3.00101490209442, 101.7182432015895),
    LatLng(3.0014424837976907, 101.7182708647747),
    LatLng(3.0019739300635315, 101.71835069123985),
    LatLng(3.0027559148132053, 101.71831267863739),
    LatLng(3.0033554367770128, 101.71830707037152),

    LatLng(3.0035017901293273, 101.71828441463371),
    LatLng(3.0035860253112086, 101.7184489683344),
    LatLng(3.003514218271321, 101.71855129584574),
    LatLng(3.003449315750435, 101.71856927230043),

    LatLng(3.0033666254284896, 101.71890585928146),
    LatLng(3.003358085399534, 101.71893301840306),
    LatLng(3.003339104722436, 101.71912122983139),
    LatLng(3.0033110707254527, 101.71934581027307),
    LatLng(3.00329787825603, 101.7196694703214),
    // LatLng(3.0032861958057424, 101.71966989550229),
    LatLng(3.0033380929212763, 101.72004934799422),
    LatLng(3.003390813796452, 101.72024897299971),
    LatLng(3.0036995685148744, 101.72093871939894),
    LatLng(3.0037793517231766, 101.72107261804666),
    LatLng(3.0037401958235037, 101.72108687614508),
    LatLng(3.0036618840199343, 101.72096330595869),
    LatLng(3.003356113979596, 101.72027414614973),
    LatLng(3.003299519979326, 101.72006408420569),
    LatLng(3.0032627001260006, 101.71987383245555),
    LatLng(3.0032420810076075, 101.71967325696706),
    LatLng(3.0032509177726707, 101.71933699805987),
    LatLng(3.003268591302621, 101.71911282545206),
    LatLng(3.003308356743932, 101.71893142262056),
    LatLng(3.00341881629555, 101.71851109898655),
    LatLng(3.003362850124128, 101.71846685439351),
    LatLng(3.003362850124128, 101.71838868894578),
    LatLng(3.0034497449679933, 101.71831642277712),
    LatLng(3.0035867147925903, 101.71836214218995),
    LatLng(3.0042353828617068, 101.71861969021239),
    LatLng(3.0070334636022196, 101.71965125226217),
    LatLng(3.008123900547188, 101.71993917463685),
    LatLng(3.0082353849073913, 101.71960911390923),
    LatLng(3.008354139967417, 101.71934700686113),
    LatLng(3.0090884822131927, 101.71984209795279),
    LatLng(3.0093538865047247, 101.72009214034568),

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
    _markers.addAll(busStopsRoute3.map((busStop) {
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
      polylineId: PolylineId('route3'),
      points: roadCoordinatesRoute3,
      color: Colors.orange,
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
      target: LatLng(3.0053571576226954, 101.71346417565545),
      zoom: 15.1,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(initialPosition));
  }

  void _animateToRoute3() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(3.0053571576226954, 101.71346417565545),
        zoom: 15.1,
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
            color: Colors.orange,
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 40.0),
            child: TextButton( // Change to TextButton
              onPressed: _animateToRoute3, // Call the animation function
              child: Text(
                'Route 3',
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
                target: LatLng(3.0054346819939006, 101.7136550657359),
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
                        primary: selectedButton == 'Low' ? Colors.green : Colors.green.withOpacity(0.3),
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
                        primary: selectedButton == 'Medium' ? Colors.yellow : Colors.yellow.withOpacity(0.3),
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
                        primary: selectedButton == 'High' ? Colors.red : Colors.red.withOpacity(0.3),
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