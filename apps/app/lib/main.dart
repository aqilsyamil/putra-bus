import 'package:flutter/material.dart';
import 'package:app/features/bus_stop/presentation/BusStopWidget.dart';
import 'package:app/features/bus_route/presentation/BusRouteWidget.dart';
import 'package:app/features/navigation/NavigationWidget.dart';
import 'package:app/features/messages/MessagesWidget.dart';



void main() {
  runApp(PutraBusApp());
}

class PutraBusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PutraBus',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
          routes: {
          '/': (context) => BusStopWidget(), 
          '/busRoutes': (context) => BusRouteWidget(), // Define the route for BusRoutesWidget
          '/navigation': (context) => NavigationWidget(), // Define the route for NavigationWidget
          '/messages': (context) => MessagesWidget(), // Define the route for MessagesWidget
        },
    );
  }
}



