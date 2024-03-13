import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SettingPage.dart';
import 'DriverLoginPage.dart';
import 'main.dart';

class SidebarPageDriver extends StatefulWidget {
  String mainStatus;

  SidebarPageDriver({
  required this.mainStatus
  });

  @override
  _SidebarPageStateDriver createState() => _SidebarPageStateDriver();
}

class _SidebarPageStateDriver extends State<SidebarPageDriver> {
  bool isDriverModeButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200,
            padding: EdgeInsets.fromLTRB(0, 80.0, 0, 0.0),
            child: Center(
              child: Image.asset(
                'assets/images/putra-t-sidebar-logo.png',
                height: 100,
              ),
            ),
          ),
          _divider(),
          _buildDrawerItem(Icons.info, 'About', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.code, 'For Developers', () async {
            const url = 'https://github.com/aqilsyamil/PUTRA_T';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print('Could not launch $url');
            }
          }),
          _buildDrawerItem(Icons.map, 'Campus Map', () {
            _showMap(context, 'assets/images/campus-map-north.jpeg', true);
          }),
          _buildDrawerItem(Icons.vrpano, 'Virtual Tour', () async {
            const url = 'https://virtualtour.upm.edu.my/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print('Could not launch $url');
            }
          }),
          _buildDrawerItem(Icons.directions_bus, 'Transit Map', () {
            _showMap(context, 'assets/images/transit_map.png', false);
          }),
          _buildDrawerItem(Icons.access_time, 'Bus Schedule', () async {
            const url = 'https://hep.upm.edu.my/perkhidmatan_utama/seksyen_pengurusan_kenderaan/jadual_perkhidmatan_bas_kampus_upm-63338?L=en';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print('Could not launch $url');
            }
          }),
          _buildDrawerItem(Icons.feedback, 'Feedback', () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'bhep@upm.edu.my',
              query: Uri.encodeFull(
                  'subject=UPM Bus.dart Feedback&body=Name of Informant:\n'
                      'Incident Date:\n'
                      'Incident Time:\n'
                      'Bus.dart Route:\n'
                      'Bus.dart Plate No.:\n'
                      'Bus.dart Stop:\n'
                      'Details:\n'),
            );
            if (await canLaunch(emailLaunchUri.toString())) {
              await launch(emailLaunchUri.toString());
            } else {
              print('Could not launch $emailLaunchUri');
            }
          }),
          _buildDrawerItem(Icons.settings, 'Settings', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPage()),
            );
          }),
          _divider(),

          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 6.0),
            child: GestureDetector(
              onTapDown: (_) => _updateButtonPressed(true),
              onTapUp: (_) => _updateButtonPressed(false),
              onTapCancel: () => _updateButtonPressed(false),
              onTap: () {
                // Navigate to DriverLoginPage when the button is tapped
                widget.mainStatus = 'user';
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(mainStatus: widget.mainStatus)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isDriverModeButtonPressed ? Color(0xFF00D161) : Colors.white,
                  border: Border.all(color: Color(0xFF00D161), width: 2.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                alignment: Alignment.center,
                child: Text(
                  'User Mode',
                  style: TextStyle(
                    color: isDriverModeButtonPressed ? Colors.white : Color(0xFF00D161),
                    fontWeight: FontWeight.bold, // Make text bold
                    fontSize: 16, // Increased font size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateButtonPressed(bool pressed) {
    setState(() {
      isDriverModeButtonPressed = pressed;
    });
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(color: Colors.grey, thickness: 0.5),
    );
  }

  void _showMap(BuildContext context, String initialImagePath, bool isCampusMap) {
    String currentImagePath = initialImagePath;

    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InteractiveViewer(
                          panEnabled: true,
                          boundaryMargin: EdgeInsets.all(100),
                          minScale: 0.5,
                          maxScale: 4,
                          child: Image.asset(currentImagePath, fit: BoxFit.contain),
                        ),
                        if (isCampusMap) ...[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    currentImagePath = 'assets/images/campus-map-north.jpeg';
                                  });
                                },
                              ),
                              SizedBox(width: 20), // Added space between buttons
                              IconButton(
                                icon: Icon(Icons.arrow_forward, color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    currentImagePath = 'assets/images/campus-map-south.jpeg';
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80.0,
                    right: 5.0,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );
  }
}
