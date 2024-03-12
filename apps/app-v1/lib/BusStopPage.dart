import 'package:flutter/material.dart';
import 'BusStop.dart';
import 'SidebarPage.dart';

class BusStopPage extends StatefulWidget {
  final List<String> starredBusStops;
  final Function(String) addToStarred;
  final Function(String) removeFromStarred;
  final Function(String, String) onBusStopSelected;
  final void Function(String) updateEndLocation;
  final String mainStatus;

  BusStopPage({
    required this.starredBusStops,
    required this.addToStarred,
    required this.removeFromStarred,
    required this.onBusStopSelected,
    required this.updateEndLocation,
    required this.mainStatus// Add this line// Initialize in constructor
  });

  @override
  _BusStopPageState createState() => _BusStopPageState();
}

class _BusStopPageState extends State<BusStopPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> manualBusStops = [];
  List<Map<String, String>> filteredBusStops = [];
  bool isSearching = false;

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


  @override
  void initState() {
    super.initState();
    manualBusStops = [
      {'name': 'Academic Complex A (Opp FBMK)', 'shortName': 'KAA'},
      {'name': 'Banquet Hall', 'shortName': 'Banquet'},
      {'name': 'Centre of Foundation Studies for Agricultural Science', 'shortName': 'ASPer'},
      {'name': 'Faculty of Agriculture', 'shortName': 'FP'},
      {'name': 'Faculty of Agriculture Cafeteria', 'shortName': 'FPC'},
      {'name': 'Faculty of Biotechnology and Biomolecular Sciences', 'shortName': 'FBSB'},
      {'name': 'Faculty of Computer Science & Information Technology', 'shortName': 'FSKTM'},
      {'name': 'Faculty of Design & Architecture', 'shortName': 'FRSB'},
      {'name': 'Faculty of Food Science & Technology', 'shortName': 'FSTM'},
      {'name': 'Faculty of Modern Languages & Communication', 'shortName': 'FBMK'},
      {'name': 'Faculty of Science', 'shortName': 'FS'},
      {'name': 'Fourteenth College', 'shortName': 'K14'},
      {'name': 'Institute for Mathematical Research', 'shortName': 'INSPEM'},
      {'name': 'Institute of Bioscience', 'shortName': 'IBS'},
      {'name': 'Putra Foodcourt', 'shortName': 'PFC'},
      {'name': 'School of Graduate Studies', 'shortName': 'SGS'},
      {'name': 'Serumpun Foodcourt', 'shortName': 'SFC'},
      {'name': 'Sports Academy', 'shortName': 'Academy'},
      {'name': 'Sultan Abdul Samad Library', 'shortName': 'PSAS'},
      {'name': 'Tenth College', 'shortName': 'K10'},
      {'name': 'Tan Sri Aishah Ghani College', 'shortName': 'KTAG'},
      {'name': 'Tan Sri Mustaffa Babjee', 'shortName': 'KMB'},
      {'name': 'Central (Great Hall & Experimental Theatre)', 'shortName': 'Central'}
    ];
    filteredBusStops = manualBusStops;
  }

  void startSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
      filterSearchResults('');
    });
  }

  void filterSearchResults(String query) {
    List<Map<String, String>> tempList = [];
    if (query.isNotEmpty) {
      for (var busStop in manualBusStops) {
        // Check if either the name or shortName contains the query
        if (busStop['name']!.toLowerCase().contains(query.toLowerCase()) ||
            busStop['shortName']!.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(busStop);
        }
      }
    } else {
      tempList.addAll(manualBusStops);
    }
    setState(() {
      filteredBusStops = tempList;
      filteredBusStops.sort((a, b) => a['name']!.compareTo(b['name']!));
    });
  }

  // void onBusStopSelected(String busStopName, String busStopShortName) {
  //   String formattedLocation = "$busStopName ($busStopShortName)";
  //
  //   widget.updateEndLocation(formattedLocation); // Adjust this to pass two strings if needed
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/p_logo.png'), // Use your own asset image
          iconSize: 40,
          onPressed: () {
            // Handle icon button press
          },
        ),
        titleSpacing: 0.0, // This removes the default spacing on the left of the title
        centerTitle: false,
        title: Text(
          'Bus Stops',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white), // Hamburger icon
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ],
      ),
      drawer: SidebarPage(mainStatus: widget.mainStatus),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                isSearching = value.isNotEmpty;
                filterSearchResults(value);
              },
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search bus stop",
                hintText: "Search bus stop",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Reduced vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Color(0xFF00D161), width: 2.5), // Green border with thickness of 2
                ),
                enabledBorder: OutlineInputBorder( // Border style when the TextField is enabled but not focused
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Color(0xFF00D161), width: 2.5),
                ),
                focusedBorder: OutlineInputBorder( // Border style when the TextField is focused
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Color(0xFF00D161), width: 2.5),
                ),
                suffixIcon: isSearching
                    ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    stopSearch();
                  },
                )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBusStops.length,
              itemBuilder: (context, index) {
                String busStopName = filteredBusStops[index]['name']!;
                String busStopShortName = filteredBusStops[index]['shortName']!;
                bool isStarred = widget.starredBusStops.contains('$busStopName|$busStopShortName');
                String imagePath = busStopImages[busStopShortName] ?? 'assets/images/default.jpg';

                return BusStop(
                  name: busStopName,
                  shortName: busStopShortName,
                  isStarred: isStarred,
                  onStarPressed: () {
                    setState(() {
                      if (isStarred) {
                        widget.removeFromStarred('$busStopName|$busStopShortName');
                      } else {
                        widget.addToStarred('$busStopName|$busStopShortName');
                      }
                    });
                  },
                  onSelect: () {
                    widget.onBusStopSelected(busStopName, busStopShortName);
                  },
                  updateEndLocation: widget.updateEndLocation,
                  imagePath: imagePath, // Pass the image path
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
