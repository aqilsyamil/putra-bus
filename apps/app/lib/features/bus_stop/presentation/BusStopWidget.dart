import 'package:flutter/material.dart';
import '../domain/BusStop.dart'; // Import the BusStop class

class BusStopWidget extends StatelessWidget {
  final BusStop busStop;

  BusStopWidget({required this.busStop});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: busStop.onSelect,
          leading: Padding(
            padding: EdgeInsets.only(right: 0.0),
            child: IconButton(
              icon: Icon(Icons.info_outline),
              iconSize: 24,
              onPressed: () => _showFullScreenImage(context),
            ),
          ),
          title: Text(
            busStop.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            busStop.shortName,
            style: TextStyle(fontSize: 14),
          ),
          trailing: IconButton(
            icon: Icon(
              busStop.isStarred ? Icons.star : Icons.star_border,
              color: busStop.isStarred ? Colors.orange : null,
            ),
            onPressed: busStop.onStarPressed,
          ),
        ),
        Divider(color: Colors.grey, thickness: 0),
      ],
    );
  }

  void _showFullScreenImage(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  busStop.imagePath,
                  fit: BoxFit.contain,
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