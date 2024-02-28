import 'package:flutter/material.dart';
import 'BusStopPage.dart';
import 'BusRoutePage.dart';
import 'NavigationPage.dart';
import 'StarredPage.dart';
import 'MessagesPage.dart';
import 'SidebarPage.dart';


// Hello Duniaa

// PutraBus comment

// Tambah lagi satu

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String mainStatus;

  MyHomePage({
    this.mainStatus = 'user'
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<String> _starredBusStops = []; // Make it private
  GlobalKey<NavigationPageState> navigationPageKey = GlobalKey();
  String endLocation = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String mainStatus = "user";

  final Map<String, String> busStopImages = {
    'PFC': 'assets/images/pfc.JPG',
    'KTAG': 'assets/images/ktag.JPG',
    'SFC': 'assets/images/sfc.JPG',
    'Central': 'assets/images/central.JPG',
    'FBMK': 'assets/images/fbmk.JPG',
    'FBSB': 'assets/images/fbsb.JPG',
    'FP': 'assets/images/fp.JPG',
    'FPC': 'assets/images/fpc.JPG',
    'FRSB': 'assets/images/frsb.JPG',
    'FS': 'assets/images/fs.JPG',
    'FSKTM': 'assets/images/fsktm.JPG',
    'FSTM': 'assets/images/fstm.JPG',
    'IBS': 'assets/images/ibs.JPG',
    'INSPEM': 'assets/images/inspem.JPG',
    'K10': 'assets/images/k10.JPG',
    'K14': 'assets/images/k14.jpg',
    'KMB': 'assets/images/kmb.JPG',
    'PSAS': 'assets/images/psas.JPG',
    'SGS': 'assets/images/sgs.JPG',
    'Banquet': 'assets/images/banquet.JPG',
    'ASPer': 'assets/images/asper.jpg',
    'KAA': 'assets/images/kaa.JPG',
    'Academy': 'assets/images/academy.jpg',
  };



  void addToStarredBusStops(String busStop) {
    setState(() {
      _starredBusStops.add(busStop);
    });
  }

  void removeFromStarredBusStops(String busStop) {
    setState(() {
      _starredBusStops.remove(busStop);
    });
  }

  void onBusStopSelected(String busStopName, String busStopShortName) {
    String formatLocation = "$busStopName ($busStopShortName)";
    updateEndLocation(formatLocation);
    setState(() {
      _currentIndex = 2; // Index of NavigationPage
    });
    navigationPageKey.currentState?.setEndLocation(formatLocation);
  }

  void updateEndLocation(String location) {
    setState(() {
      _currentIndex = 2; // Navigate to NavigationPage
      endLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SidebarPage(mainStatus: mainStatus),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          BusStopPage(
            starredBusStops: _starredBusStops,
            addToStarred: addToStarredBusStops,
            removeFromStarred: removeFromStarredBusStops,
            onBusStopSelected: onBusStopSelected,
            updateEndLocation: updateEndLocation,
            mainStatus: mainStatus
          ),
          BusRoutePage(
            mainStatus: mainStatus
          ),
          NavigationPage(
            key: navigationPageKey,
            endLocation: endLocation,
            mainStatus: mainStatus
          ),
          StarredPage(
            starredBusStops: _starredBusStops,
            removeFromStarred: removeFromStarredBusStops,
            scaffoldKey: _scaffoldKey,
            busStopImages: busStopImages,
            updateEndLocation: updateEndLocation,
            mainStatus: mainStatus
          ),
          MessagesPage(
            mainStatus: mainStatus
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: _currentIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Bus Stops',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_bus,
              color: _currentIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.navigation,
              color: _currentIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Navigation',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: _currentIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Starred',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: _currentIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: 'Messages',
          ),
        ],
        selectedItemColor: Colors.black, // Color when selected
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,// Color when not selected
      ),
    );
  }
}
