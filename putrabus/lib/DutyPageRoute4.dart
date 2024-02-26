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
class DutyPageRoute4 extends StatefulWidget {
  final String? driverFullName;
  final String? busPlateNumber;

  DutyPageRoute4({this.driverFullName, this.busPlateNumber});
  @override
  _DutyPageRoute4State createState() => _DutyPageRoute4State();
}

class _DutyPageRoute4State extends State<DutyPageRoute4> {
  late GoogleMapController mapController;
  String? selectedButton;
  bool _isSatelliteView = false;
  GoogleMapController? _googleMapController;

  final List<BusStop> busStopsRoute4 = [
    BusStop(
      id: 'SJ101-4',
      name: 'KAA',
      position: LatLng(3.0002087160519513, 101.71523932855689), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-4',
      name: 'FBMK',
      position: LatLng(2.9999843428909356, 101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-4',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-4',
      name: 'FS',
      position: LatLng(3.0007085010742323, 101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-4',
      name: 'Library',
      position: LatLng(3.0026803506513735, 101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-4',
      name: 'FSTM',
      position: LatLng(3.004266665826632, 101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-4',
      name: 'Central',
      position: LatLng(3.0012917167440483, 101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ800-4',
      name: 'KMB',
      position: LatLng(2.9783026611102827, 101.71456541612027), // Replace with the actual coordinates
    ),
  ];

  List<LatLng> roadCoordinatesRoute4 = [
    LatLng(2.9781750765702664, 101.71455617972484),
    LatLng(2.9782174279856704, 101.71473906721164),
    LatLng(2.9782293393204786, 101.71486231747448),
    LatLng(2.978232822565636, 101.71499894243874),
    LatLng(2.978210633149574, 101.71517669785513),
    LatLng(2.97819105425267, 101.7153100144174),
    LatLng(2.9781492859381147, 101.7154956119845),
    LatLng(2.9781375385993587, 101.71561063019509),
    LatLng(2.9781871384732463, 101.71572434138055),
    LatLng(2.978294771352272, 101.71580363791638),
    LatLng(2.979331770481007, 101.71607682884402),
    LatLng(2.9796483253584416, 101.71613293209569),
    LatLng(2.980102147224825, 101.71610488046984),
    LatLng(2.980385213176475, 101.71599737902567),
    LatLng(2.9804481363047657, 101.7159034004595),
    LatLng(2.980450367264187, 101.71576548750608),
    LatLng(2.9805289111336335, 101.7156578608327),
    LatLng(2.9805206433581617, 101.71533705055624),
    LatLng(2.980386291990484, 101.71486307924461),
    LatLng(2.9794617408570963, 101.71251995805514),
    LatLng(2.9794424204460093, 101.7124232252434),
    LatLng(2.979421613848599, 101.71186217493509),
    LatLng(2.9794528237422147, 101.71151988960112),
    LatLng(2.979442420444432, 101.7113070774152),
    LatLng(2.979561315270218, 101.71112254097427),
    LatLng(2.980129568492452, 101.71085656581836),
    LatLng(2.9802037390578136, 101.71081490159789),
    LatLng(2.9806523803601688, 101.71046528444357),
    LatLng(2.9812855431898586, 101.70976967311061),
    LatLng(2.981497200400042, 101.70950881886078),
    LatLng(2.981985639952186, 101.70908855368049),
    LatLng(2.9831316465967608, 101.70830278965867),
    LatLng(2.9836478037951464, 101.70787016061853),
    LatLng(2.9844392443299186, 101.70711210265446),
    LatLng(2.9848521696186814, 101.70671775937014),
    LatLng(2.9852345076934346, 101.70643061620193),
    LatLng(2.985762134018069, 101.7061626159116),
    LatLng(2.986126277282352, 101.70601362294806),
    LatLng(2.986822271625854, 101.7058594702493),
    LatLng(2.9883374631805464, 101.70571181327549),
    LatLng(2.9883890138742877, 101.70571215115685),
    LatLng(2.9892901863367873, 101.70548188130424),
    LatLng(2.990888470321564, 101.70467391849415),
    LatLng(2.9916432982105885, 101.70426591950262),
    LatLng(2.9920625042404985, 101.70408212471885),
    LatLng(2.9926635729052498, 101.70396221669982),
    LatLng(2.993662504227182, 101.70391501172206),
    LatLng(2.9943471645111175, 101.70383633675914),
    LatLng(2.995512208366044, 101.70358907259),
    LatLng(2.9960678343522504, 101.70349750807755),
    LatLng(2.9982871054565825, 101.703487521171),
    LatLng(2.9983494037762792, 101.70359210564244),
    LatLng(2.9983152698115125, 101.70425250175302),
    LatLng(2.9982760835778843, 101.70557183768005),
    LatLng(2.998423052278996, 101.7062215401411),
    LatLng(2.998620205379566, 101.70692149583121),
    LatLng(2.998967008826348, 101.70692785410236),
    LatLng(2.9995896218006357, 101.7069618436787),
    LatLng(3.0009210612319444, 101.70698362117874),
    LatLng(3.0023660699040966, 101.70699813951211),
    LatLng(3.0033930397826305, 101.70704411423442),
    LatLng(3.0042315297648705, 101.70692312812305),
    LatLng(3.0042001166123997, 101.70784262256933),
    LatLng(3.0041807854382645, 101.7086362914598),
    LatLng(3.0041807854366103, 101.7093307517391),
    LatLng(3.004091378751797, 101.70949771257278),
    LatLng(3.0039560605063103, 101.7095945014619),
    LatLng(3.0037748306874406, 101.70965015507313),
    LatLng(3.003685423967247, 101.70966951285095),
    LatLng(3.0031175703111894, 101.70968403118431),
    LatLng(3.001822112030174, 101.70965290867011),
    LatLng(3.0017063268852167, 101.70966160759136),
    LatLng(3.0004410896742177, 101.709594419533),
    LatLng(3.000188681059766, 101.70994635698162),
    LatLng(3.0001610991649414, 101.71055480850036),
    LatLng(3.000065554500925, 101.71134275721687),
    LatLng(3.000009856178071, 101.71206677965037),
    LatLng(2.999828812935704, 101.7131232033733),
    LatLng(2.999875500768863, 101.71317385126457),
    LatLng(2.999850575873873, 101.71326580124875),
    LatLng(2.999813826138738, 101.71331392453956),
    LatLng(2.999828917036646, 101.71348025595675),
    LatLng(2.999814185102259, 101.71355736946595),
    LatLng(3.000155679108734, 101.71524425498147),
    LatLng(3.0003751676483974, 101.71631332968167),
    LatLng(3.0004305725202105, 101.7163944171838),
    LatLng(3.0007736564397764, 101.71810579025681),
    LatLng(3.0009931448564418, 101.71826156361631),
    LatLng(3.0014001572475837, 101.71828076855104),
    LatLng(3.0019563362188686, 101.7183703915798),
    LatLng(3.0033091019869382, 101.71832770228254),
    LatLng(3.0034729006957894, 101.71828318148108),
    LatLng(3.003533740208371, 101.71831364308208),
    LatLng(3.003589899755444, 101.71839096868457),
    LatLng(3.003533740208371, 101.71851750148866),
    LatLng(3.003426101068411, 101.71852453108892),
    LatLng(3.0033301618260277, 101.71846595108701),
    LatLng(3.0024741135141904, 101.71843747675472),
    LatLng(3.0019342882634845, 101.71847418193353),
    LatLng(3.001339988803237, 101.71837595696749),
    LatLng(3.000925845766, 101.71836552738291),
    LatLng(3.0007148030357107, 101.71835918740759),
    LatLng(3.000672594482808, 101.71827888105332),
    LatLng(3.0004298952895367, 101.71690310640598),
    LatLng(3.0003264843058175, 101.71641704163036),
    LatLng(3.0003307051622143, 101.71634941522683),
    LatLng(3.0000183617366325, 101.71484684107278),
    LatLng(2.9997841041149513, 101.71358307265629),
    LatLng(2.999731343382476, 101.71348163305096),
    LatLng(2.9996806930743, 101.71327664051522),
    LatLng(2.999611048900296, 101.71311814113187),
    LatLng(2.999532963002963, 101.71294907512299),
    LatLng(2.99925438623546, 101.71234889079143),
    LatLng(2.999136202133929, 101.71191988579388),
    LatLng(2.999041232751697, 101.71097522946908),
    LatLng(2.9988555148344713, 101.70953816839354),
    LatLng(2.998591710915679, 101.70805461416549),
    LatLng(2.998604373504361, 101.70746499645949),
    LatLng(2.998564275304577, 101.70691341860544),
    LatLng(2.9982498209434665, 101.70576799639518),
    LatLng(2.9982308270518248, 101.7055313039827),
    LatLng(2.9982941400171272, 101.70372018436248),
    LatLng(2.9981295262991163, 101.70354900502848),
    LatLng(2.996083067456943, 101.7035548559328),
    LatLng(2.9943084809265756, 101.70390839800118),
    LatLng(2.9936928473451707, 101.70399112023024),
    LatLng(2.993634716373783, 101.7040275017329),
    LatLng(2.993491486709613, 101.7040438187627),
    LatLng(2.993122787648066, 101.7040734920674),
    LatLng(2.992690543171915, 101.7040772888644),
    LatLng(2.99212090912754, 101.70419508453459),
    LatLng(2.9918803839940753, 101.70428320165067),
    LatLng(2.9916183484266896, 101.70440264929691),
    LatLng(2.991115787504855, 101.70463567011507),
    LatLng(2.991031020405482, 101.7046767211656),
    LatLng(2.989691544779214, 101.70535180139616),
    LatLng(2.9888606836307017, 101.7056784280845),
    LatLng(2.9867919406811962, 101.70592429493131),
    LatLng(2.9861389275716634, 101.7060786156118),
    LatLng(2.9857538582156655, 101.7062543327595),
    LatLng(2.985320599078553, 101.70652349057671),
    LatLng(2.9847707402180723, 101.70696962887645),
    LatLng(2.9846668653363824, 101.70710208729355),
    LatLng(2.9842286963153946, 101.70748062888117),
    LatLng(2.9835070057909934, 101.70811357991255),
    LatLng(2.982988227959795, 101.70850673569221),
    LatLng(2.9819468446165525, 101.70924519642364),
    LatLng(2.9814744610883652, 101.70967727199856),
    LatLng(2.9805946211118104, 101.71061575363392),
    LatLng(2.9805907822979294, 101.71062767701456),
    LatLng(2.9802068248491533, 101.7109569903583),
    LatLng(2.979677143062724, 101.71121674625337),
    LatLng(2.9795495032335224, 101.7113607604758),
    LatLng(2.9795117506051474, 101.71152817700937),
    LatLng(2.979441638570735, 101.71186120989876),
    LatLng(2.979466806991395, 101.71242826589956),
    LatLng(2.9795566942074623, 101.71275769843338),
    LatLng(2.9804016336550276, 101.71484590465857),
    LatLng(2.9805562395237213, 101.71534455390373),
    LatLng(2.980662306332098, 101.71563078217082),
    LatLng(2.980815114422067, 101.71571899088205),
    LatLng(2.9807935415165314, 101.71590800954898),
    LatLng(2.980709047632468, 101.71598001666021),
    LatLng(2.980565228240396, 101.71599801843801),
    LatLng(2.9805041049930625, 101.71596561523796),
    LatLng(2.9804322982709257, 101.71599764723403),
    LatLng(2.980394128492805, 101.71601038772684),
    LatLng(2.9801262402544264, 101.71611972044164),
    LatLng(2.9796447650944993, 101.71615391860658),
    LatLng(2.9793122539101127, 101.71610089637447),
    LatLng(2.978794701193362, 101.71596285096953),
    LatLng(2.978298148142406, 101.71582493220282),
    LatLng(2.9781504182452236, 101.71572289798512),
    LatLng(2.9781105803957355, 101.71561879030864),
    LatLng(2.9781105803957355, 101.71556235811018),
    LatLng(2.9781134953603736, 101.7154884124708),
    LatLng(2.978137786733169, 101.71538430479431),
    LatLng(2.978172766307544, 101.71525879180118),
    LatLng(2.9782019159527944, 101.7149474417407),
    LatLng(2.9781931710595413, 101.71474603717031),
    LatLng(2.9781416733515256, 101.7145261461901),
    LatLng(2.9780810145035206, 101.7143300171776),
    LatLng(2.9780883806166245, 101.71432264110281),
    LatLng(2.9781750765702664, 101.71455617972484),
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
    _markers.addAll(busStopsRoute4.map((busStop) {
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
      polylineId: PolylineId('route4'),
      points: roadCoordinatesRoute4,
      color: Colors.lightBlueAccent,
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
      target: LatLng(2.992612523199772, 101.71213422185365),
      zoom: 14.1,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(initialPosition));
  }

  void _animateToRoute4() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(2.992612523199772, 101.71213422185365),
        zoom: 14.1,
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
            color: Colors.lightBlueAccent,
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 40.0),
            child: TextButton( // Change to TextButton
              onPressed: _animateToRoute4, // Call the animation function
              child: Text(
                'Route 4',
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