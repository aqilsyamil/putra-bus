import 'package:flutter/material.dart';
import 'package:app/components/bars/appbar.dart';
import 'package:app/components/bars/navbar.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Messages'), // Custom app bar
      body: Container(), // Empty body
      bottomNavigationBar: Navbar(
        selectedIndex: 3, // Adjust the selected index if needed
        onItemTapped: (index) {}, // Placeholder function for item tap
      ),
    );
  }
}
