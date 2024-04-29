import 'package:flutter/material.dart';
import 'package:app/components/bars/appbar.dart';
import 'package:app/components/bars/navbar.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Navigation'),
      body: Container(),
      bottomNavigationBar: Navbar(
        selectedIndex: 2,
        onItemTapped: (index) {},
      ),
    );
  }
}
