import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SidebarPage.dart';
import 'SidebarPageDriver.dart';

class MessagesPage extends StatefulWidget {
  String mainStatus;



  MessagesPage({
    required this.mainStatus
  });

  @override
  _MessagesPage createState() => _MessagesPage();
}

class _MessagesPage extends State<MessagesPage> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/p_logo.png'),
          iconSize: 40,
          onPressed: () {},
        ),
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Messages',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => _scaffoldKey.currentState?.openDrawer()
            , // Open drawer
          ),
        ],
      ),
      drawer: widget.mainStatus == 'driver'
          ? SidebarPageDriver(mainStatus: widget.mainStatus)
          : SidebarPage(mainStatus: widget.mainStatus),
      body: ListView(
        children: [
          messageTile(
            title: 'Important Notice!',
            message:
                'Please note that Route 2 is facing technical issues. For a smooth ride back to the dormitory area, consider Route 1 as an alternative.',
            icon: Icons.error_outline,
            time: 'Today\n12:38 pm',
            color: Colors.red,
          ),
          messageTile(
            title: 'Exciting news!',
            message:
                'To enhance your commuting experience, we\'ve increased the frequency of Routes 1, 2, and 3 during peak hours to every 5 minutes!',
            icon: Icons.campaign,
            time: '01/12/2023\n3:24 pm',
            color: Colors.green,
          ),
          SizedBox(height: 20),
          contactInfo(context),
        ],
      ),
    );
  }

  Widget messageTile(
      {required String title,
      required String message,
      required IconData icon,
      required String time,
      required Color color}) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green, width: 2.0),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: ListTile(
          leading: Icon(icon, color: color),
          title: Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(message),
          trailing: Text(time),
        ),
      ),
    );
  }

  void _showTransitMap(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black, // Black and opaque background
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Center( // Center the InteractiveViewer
              child: InteractiveViewer(
                panEnabled: false, // Disable panning
                boundaryMargin: EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 4,
                child: Image.asset(
                  'assets/images/transit_map.png',
                  fit: BoxFit.contain, // Ensure the entire image is visible
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // Method to launch Bus.dart Schedule URL
  Future<void> _launchBusScheduleURL() async {
    const url = 'https://hep.upm.edu.my/perkhidmatan_utama/seksyen_pengurusan_kenderaan/jadual_perkhidmatan_bas_kampus_upm-63338?L=en';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> _launchFeedbackEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'bhep@upm.edu.my',
      query: Uri.encodeFull(
          'subject=UPM Bus Feedback&body=Name of Informant:\n'
              'Incident Date:\n'
              'Incident Time:\n'
              'Bus Route:\n'
              'Bus Plate No.:\n'
              'Bus Stop:\n'
              'Details:\n'),
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      print('Could not launch $emailLaunchUri');
    }
  }


  Widget contactInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Text(
            'For more information, visit our website',
            style: TextStyle(color: Colors.grey),
          ),
          InkWell(
            onTap: () async {
              const url = 'https://hep.upm.edu.my/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Could not launch $url'),
                  ),
                );
              }
            },
            child: Text(
              'https://hep.upm.edu.my/',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Transport Management Section\nStudent Affairs Division\nUniversiti Putra Malaysia\nCancellory Putra\'s Building\n43400 UPM Serdang\nSelangor Darul Ehsan',
            style: TextStyle(
              fontSize: 12,
              height: 1.2,
            ),
          ),
          SizedBox(height: 20),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00D161),
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjusted padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          _showTransitMap(context);
                        },
                        child: Text(
                          'UPM Transit Map',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Adjusted font size
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00D161),
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjusted padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed:
                          _launchBusScheduleURL,
                        child: Text(
                          'Bus Schedule',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Adjusted font size
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00D161),
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjusted padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed:
                        _launchFeedbackEmail,
                        child: Text(
                          'Feedback',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Adjusted font size
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

    );
  }
}
