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
class DutyPageRoute5 extends StatefulWidget {
  final String? driverFullName;
  final String? busPlateNumber;

  DutyPageRoute5({this.driverFullName, this.busPlateNumber});
  @override
  _DutyPageRoute5State createState() => _DutyPageRoute5State();
}

class _DutyPageRoute5State extends State<DutyPageRoute5> {
  late GoogleMapController mapController;
  String? selectedButton;
  bool _isSatelliteView = false;
  GoogleMapController? _googleMapController;

  final List<BusStop> busStopsRoute5 = [
    BusStop(
      id: 'SJ163-5',
      name: 'SFC',
      position: LatLng(2.9921172880176776, 101.71541414629283), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ162-5',
      name: 'KTAG',
      position: LatLng(2.9906065922278406, 101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ100-5',
      name: 'PFC',
      position: LatLng(2.991720962366472, 101.707556203837),
    ),
    BusStop(
      id: 'SJ700-5',
      name: 'SGS',
      position: LatLng(2.9925463325179167, 101.72430695038778),
    ),
    BusStop(
      id: 'SJ827-5',
      name: 'Banquet Hall',
      position: LatLng(2.9878375695781485, 101.72503795411446),
    ),
    BusStop(
      id: 'SJ831-5',
      name: 'Sports Academy',
      position: LatLng(2.9874379317132123, 101.72592839245425),
    ),
    BusStop(
      id: 'SJ830-5',
      name: 'FP',
      position: LatLng(2.9831610495743246, 101.73395716737106),
    ),
    BusStop(
      id: 'SJ882-5',
      name: 'FP Cafeteria',
      position: LatLng(2.9836469496928983, 101.73592187569136),
    ),
  ];

  List<LatLng> roadCoordinatesRoute5 = [
    LatLng(2.991720962366472, 101.707556203837),
    LatLng(2.991733689682825, 101.70762144500674), // Starting Bus Stop 1: PFC
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
    LatLng(2.992066615302367, 101.71774437022239),
    LatLng(2.992079618435328, 101.71794691730267),
    LatLng(2.9921489684752105, 101.71799466054303),
    LatLng(2.9921533028525635, 101.71811763555606),
    LatLng(2.9921027351157727, 101.718169719091),
    LatLng(2.9921446340978455, 101.71827822645542),
    LatLng(2.992212539341248, 101.7184243497062),
    LatLng(2.99244529261938, 101.71882131014057),
    LatLng(2.9926950152631124, 101.71896258888478),
    LatLng(2.9927741696937185, 101.71908306793541),
    LatLng(2.9927488402782783, 101.71930817353001),
    LatLng(2.992644356426241, 101.7198931310259),
    LatLng(2.9927011105076833, 101.71995955648059),
    LatLng(2.992646600245777, 101.72008510130111),
    LatLng(2.9925498445242065, 101.72014787371137),
    LatLng(2.992511687335904, 101.72023111538584),
    LatLng(2.99246535360545, 101.72030889858986),
    LatLng(2.9920915985007914, 101.72114829562658),
    LatLng(2.9919783867577157, 101.72132520642649),
    LatLng(2.9918170818171883, 101.72146598519589),
    LatLng(2.9915021005592437, 101.72165887083717),
    LatLng(2.9913433187771967, 101.72186392400167),
    LatLng(2.9912973268078265, 101.72210625955962),
    LatLng(2.991236068466891, 101.72305732092627),
    LatLng(2.9912480765630023, 101.72320161467927),
    LatLng(2.9912465755528523, 101.72321063303882),
    LatLng(2.991381666625147, 101.72356084600185),
    LatLng(2.991999918791966, 101.72413790741037),
    LatLng(2.9921922127157727, 101.72429283618628),
    LatLng(2.9926036064313024, 101.72468352487955),
    LatLng(2.9926622047367797, 101.72465767495646),
    LatLng(2.9926869909460234, 101.72459645214455),
    LatLng(2.9926638571507467, 101.72453853867385),
    LatLng(2.992407732956135, 101.72416954713185),
    LatLng(2.9924093853704714, 101.7241215616847),
    LatLng(2.9924407812426708, 101.72408184959049),
    LatLng(2.9927481302597494, 101.7238336490017),
    LatLng(2.9927762212946507, 101.72383695834289),
    LatLng(2.992802397616754, 101.72385369295858),
    LatLng(2.993040763758468, 101.7241479807251),
    LatLng(2.9930274438832005, 101.72419163259094),
    LatLng(2.992665427633015, 101.72449980639983),
    LatLng(2.9926970674710227, 101.72454611239247),
    LatLng(2.9927059915277328, 101.72459160599927),
    LatLng(2.9927027464162004, 101.7246289757477),
    LatLng(2.992680030635285, 101.72467609412617),
    LatLng(2.9926110720102628, 101.72471183910294),
    LatLng(2.992585111115563, 101.72470371524459),
    LatLng(2.9925364344327345, 101.72466553311024),
    LatLng(2.9924212329500186, 101.72453473899071),
    LatLng(2.9922553369099263, 101.72436976365137),
    LatLng(2.992140608397243, 101.72428413178453),
    LatLng(2.991771788212132, 101.72400430683052),
    LatLng(2.991550043498094, 101.72380718317875),
    LatLng(2.9913135911782667, 101.72349337138824),
    LatLng(2.9912796506490342, 101.7234186003479),
    LatLng(2.9912242144512375, 101.723219210907),
    LatLng(2.991209506888093, 101.72309572540101),
    LatLng(2.991211769588966, 101.72308779513916),
    LatLng(2.991227608503082, 101.72263123863532),
    LatLng(2.9912835046394535, 101.72200385675139),
    LatLng(2.9913004749034715, 101.72193135150015),
    LatLng(2.991311788412673, 101.72186224493257),
    LatLng(2.991333284079812, 101.72180899888868),
    LatLng(2.9914113472942554, 101.72170703837915),
    LatLng(2.9918125943068397, 101.72143276231029),
    LatLng(2.9919658010026344, 101.72130146049088),
    LatLng(2.9920624178238358, 101.72113422343669),
    LatLng(2.992457644599481, 101.72027369617176),
    LatLng(2.992457644599481, 101.7201146388528),
    LatLng(2.992405343481927, 101.71999437600186),
    LatLng(2.992461518756398, 101.71988381176796),
    LatLng(2.992554498514736, 101.71984889674674),
    LatLng(2.9925685455070283, 101.71981411670893),
    LatLng(2.992699744299059, 101.71923167443266),
    LatLng(2.992691990869086, 101.71906710170497),
    LatLng(2.9926318992141177, 101.7189958433532),
    LatLng(2.992549668523035, 101.71893408611498),
    LatLng(2.9924595310276563, 101.71891033333105),
    LatLng(2.9924769259834827, 101.71915577876496),
    LatLng(2.9924532055891047, 101.71940280771781),
    LatLng(2.9924105088779402, 101.7195469079403),
    LatLng(2.992299064037923, 101.71980343983907),
    LatLng(2.9922357441179805, 101.71990291835874),
    LatLng(2.9921318224336138, 101.72001175547447),
    LatLng(2.991922998732919, 101.72018978276859),
    LatLng(2.9918162167899887, 101.72024515603799),
    LatLng(2.9913872694088646, 101.72039471143611),
    LatLng(2.9911338734449258, 101.72040676205339),
    LatLng(2.9905453806756888, 101.72035746471377),
    LatLng(2.9896254152791832, 101.72020042069028),
    LatLng(2.989597139954331, 101.72020985864371),
    LatLng(2.989277941043521, 101.72031796385458),
    LatLng(2.98886905476985, 101.72065015372185),
    LatLng(2.988732759313313, 101.72090509013161),
    LatLng(2.988411307693965, 101.72206904222467),
    LatLng(2.9883213012218555, 101.72243470859013),
    LatLng(2.9881241671525673, 101.72344894602749),
    LatLng(2.9880430951625923, 101.72374158014205),
    LatLng(2.988031782791419, 101.72389828099051),
    LatLng(2.9879356276311144, 101.72430419282679),
    LatLng(2.9878233696092162, 101.72482341720506),
    LatLng(2.9877422975970283, 101.72513304297789),
    LatLng(2.987421780274435, 101.72645839232251),
    LatLng(2.9871634809560317, 101.72769689541373),
    LatLng(2.98716913714611, 101.72783282867982),
    LatLng(2.987229469839631, 101.7283274747315),
    LatLng(2.9873878431429897, 101.72879191339071),
    LatLng(2.988344088469682, 101.73045728066165),
    LatLng(2.988365186081103, 101.73064909723824),
    LatLng(2.9879824705309437, 101.7308539541315),
    LatLng(2.9878091201099766, 101.73090761743688),
    LatLng(2.987314784514506, 101.73097228510572),
    LatLng(2.986591924184103, 101.73095030107348),
    LatLng(2.986389048421542, 101.73096862559402),
    LatLng(2.985275154420979, 101.73131946616908),
    LatLng(2.984603457240231, 101.73157135176113),
    LatLng(2.983339049290458, 101.73228327727598),
    LatLng(2.983139753691463, 101.73240554475942),
    LatLng(2.9829705565232483, 101.73262396237448),
    LatLng(2.9827707815172366, 101.73352008698204),
    LatLng(2.982687381421437, 101.73376317952585),
    LatLng(2.9828855677950146, 101.73384274212684),
    LatLng(2.982985427142873, 101.73386469221258),
    LatLng(2.9830503763073315, 101.73386469221258),
    LatLng(2.983256727403623, 101.73379618585624),
    LatLng(2.9833212639651565, 101.73379496653276),
    LatLng(2.9839997908020517, 101.7339808147648),
    LatLng(2.9840807175756594, 101.73407925462438),
    LatLng(2.984260724557282, 101.73473850748125),
    LatLng(2.984495110515414, 101.73558831726395),
    LatLng(2.983602029769113, 101.73584238155921),
    LatLng(2.9827355407745917, 101.73608758202803),
    LatLng(2.9824048649449706, 101.73497734148762),
    LatLng(2.982422155186771, 101.73491241514022),
    LatLng(2.9824626064517625, 101.73487649911324),
    LatLng(2.9829656318426947, 101.73471514296371),
    LatLng(2.9829700055652135, 101.73467572605232),
    LatLng(2.982974379287707, 101.73463046959847),
    LatLng(2.9828561758275267, 101.73425110042275),
    LatLng(2.982873670719231, 101.73420146431211),
    LatLng(2.982902828871434, 101.7341635072863),
    LatLng(2.9833962457274015, 101.7340169564063),
    LatLng(2.983446647518204, 101.73386748697598),
    LatLng(2.9834358028645434, 101.7338442208519),
    LatLng(2.9833143383609104, 101.73381923363543),
    LatLng(2.9830531910399696, 101.73389062904971),
    LatLng(2.9828827778796976, 101.7338696481835),
    LatLng(2.9826510078695745, 101.73376461015702),
    LatLng(2.9827498492494193, 101.73347939053862),
    LatLng(2.982893821863072, 101.73278121007344),
    LatLng(2.982941648327682, 101.73260773694733),
    LatLng(2.982943773950122, 101.73260667269498),
    LatLng(2.9830309243912363, 101.73246725564272),
    LatLng(2.9831031954835163, 101.73238637246735),
    LatLng(2.984608199899561, 101.73152056151287),
    LatLng(2.9862899518102366, 101.7309351578889),
    LatLng(2.9866278756658504, 101.73090682036133),
    LatLng(2.9874117051173794, 101.73093729458537),
    LatLng(2.9876807208035263, 101.73089944755395),
    LatLng(2.987935285181491, 101.73083933756297),
    LatLng(2.988303236202888, 101.73064676296204),
    LatLng(2.9883021245685955, 101.73056661630733),
    LatLng(2.9882898965912736, 101.73053990075577),
    LatLng(2.987878591814472, 101.72984418326685),
    LatLng(2.9874017004026383, 101.72905718764335),
    LatLng(2.987246071457286, 101.72868316992127),
    LatLng(2.987129349735028, 101.72824347646824),
    LatLng(2.987074879593949, 101.72775257820804),
    LatLng(2.987075991229488, 101.72761232156225),
    LatLng(2.9871460242665937, 101.72712364959797),
    LatLng(2.9873442550468723, 101.72627322069746),
    LatLng(2.9875964131597046, 101.72535205862725),
    LatLng(2.9877732548252807, 101.72467223875068),
    LatLng(2.9879892388811875, 101.72375109615648),
    LatLng(2.988076115255152, 101.72346836355916),
    LatLng(2.9882911342428957, 101.72238962995712),
    LatLng(2.9886885934765752, 101.72091072098655),
    LatLng(2.988860174190533, 101.72061058946016),
    LatLng(2.9889122999717403, 101.72053664401163),
    LatLng(2.9890404425066928, 101.7204235509727),
    LatLng(2.989561840249049, 101.7201655994606),
    LatLng(2.9905392806096773, 101.72031877795051),
    LatLng(2.9915327397308826, 101.72032435953784),
    LatLng(2.9918103029781746, 101.72022226065178),
    LatLng(2.9920750068648365, 101.71996739026116),
    LatLng(2.9922277206165377, 101.71973290950177),
    LatLng(2.9923125615805017, 101.71953920800489),
    LatLng(2.992373647070503, 101.71922996526428),
    LatLng(2.992325699019763, 101.71888169257066),
    LatLng(2.9920313765281294, 101.71820170297954),
    LatLng(2.991958521523336, 101.71804737624778),
    LatLng(2.9920285744126494, 101.71795478020871),
    LatLng(2.992020168066173, 101.71778081189291),
    LatLng(2.9920341786463944, 101.71761526139886),
    LatLng(2.9920227473562915, 101.71655436968305),
    LatLng(2.9919667050438794, 101.71483432810896),
    LatLng(2.991910662729278, 101.71340049247385),
    LatLng(2.9917761611615727, 101.71303010831758),
    LatLng(2.9913222182453145, 101.71255309841936),
    LatLng(2.990585261137269, 101.71182916575044),
    LatLng(2.9904955933201, 101.71160188456363),
    LatLng(2.9904899890812917, 101.71154015387094),
    LatLng(2.9904787806035724, 101.71106594991335),
    LatLng(2.9905362746460615, 101.70790572745317),
    LatLng(2.990698093248244, 101.70771913675797),
    LatLng(2.991309744451051, 101.70765741637862),
    LatLng(2.991720962366472, 101.707556203837),
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
    _markers.addAll(busStopsRoute5.map((busStop) {
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
      polylineId: PolylineId('route5'),
      points: roadCoordinatesRoute5,
      color: Colors.deepPurple,
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
      target: LatLng(2.9899339084011047, 101.72157161579507),
      zoom: 14.2,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(initialPosition));
  }

  void _animateToRoute5() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(2.9899339084011047, 101.72157161579507),
        zoom: 14.2,
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
            color: Colors.deepPurple,
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 40.0),
            child: TextButton( // Change to TextButton
              onPressed: _animateToRoute5, // Call the animation function
              child: Text(
                'Route 5',
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
                target: LatLng(2.9899339084011047, 101.72157161579507),
                zoom: 14.2,
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