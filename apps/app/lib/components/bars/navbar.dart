import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const Navbar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red,
      onTap: (index) {
        // Check if the index corresponds to "Routes"
        if (index == 0) {
          // Navigate to the BusRoutesWidget
          Navigator.pushNamed(context, '/busRoutes');
        } else {
          // Call the provided onItemTapped function for other indices
          onItemTapped(index);
        }
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Bus Stops',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bus),
          label: 'Routes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.navigation),
          label: 'Navigation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
      ],
    );
  }
}
