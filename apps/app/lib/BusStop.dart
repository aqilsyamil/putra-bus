import 'package:flutter/material.dart';

import 'model/User.dart';

class BusStop extends StatelessWidget {
  final String name;
  final String shortName;
  final bool isStarred;
  final Function() onStarPressed;
  final Function() onSelect;
  final String imagePath;
  final Function(String) updateEndLocation;

  BusStop({
    super.key,
    required this.name,
    required this.shortName,
    required this.isStarred,
    required this.onStarPressed,
    required this.onSelect,
    required this.imagePath,
    required this.updateEndLocation,
  });
  User userize = User(
      id: "HELLO"
  );

  void checkUserize () async {
    // dynamic a = userize.userLocation != null ? userize.userLocation : "";
    userize.updateUserLocation();

    // int seconds = 0;
    while (userize.userLocation == null) {
      // print(seconds);
      await Future.delayed(Duration(seconds: 1));
      // seconds++;
    }


    print(userize.userLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            checkUserize();
            onBusStopSelect();
          },
          leading: Padding(
            padding: EdgeInsets.only(right: 0.0), // Reduce padding to bring text closer to the icon
            child: IconButton(
              icon: Icon(Icons.info_outline),
              iconSize: 24, // Smaller icon size
              onPressed: () => _showFullScreenImage(context, imagePath),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            shortName,
            style: TextStyle(fontSize: 14),
          ),
          trailing: IconButton(
            icon: Icon(
              isStarred ? Icons.star : Icons.star_border,
              color: isStarred ? Colors.orange : null,
            ),
            onPressed: onStarPressed,
          ),
        ),
        Divider(color: Colors.grey, thickness: 0),
      ],
    );
  }

  void onBusStopSelect() {
    onSelect();
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9), // Semi-transparent black background
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: <Widget>[
              Center(
                child: InteractiveViewer(
                  panEnabled: false, // Disable panning
                  boundaryMargin: EdgeInsets.all(20),
                  minScale: 0.5,
                  maxScale: 4,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
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
  }
}
