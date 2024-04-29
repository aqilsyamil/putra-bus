import 'package:flutter/material.dart';
import 'package:app/components/bars/appbar.dart';
import 'package:app/components/bars/navbar.dart';

class BusRouteWidget extends StatelessWidget {
  const BusRouteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bus Routes'),
      body: Container(),
      bottomNavigationBar: Navbar(
        selectedIndex: 1,
        onItemTapped: (index) {},
      ),
    );
  }
}
