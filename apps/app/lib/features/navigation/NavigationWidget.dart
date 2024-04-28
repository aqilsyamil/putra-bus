import 'package:flutter/material.dart';
import 'package:app/components/bars/AppBar.dart';
import 'package:app/components/bars/NavBar.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Navigation'), 
      body: Container(),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 2, 
        onItemTapped: (index) {},
      ),
    );
  }
}
