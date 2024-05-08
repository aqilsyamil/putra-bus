import 'package:flutter/material.dart';
import 'package:app/components/bars/AppBar.dart';
import 'package:app/components/bars/NavBar.dart';

class BusRouteWidget extends StatelessWidget {
  const BusRouteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bus Routes'),
      body: Container(), 
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 1, 
        onItemTapped: (index) {},
      ),
    );
  }
}
