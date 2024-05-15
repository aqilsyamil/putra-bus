import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key,
      required this.currentIndex,
      required this.type,
      required this.items,
      required this.selectedItemColor,
      required this.onTap});

  final int currentIndex;
  final void Function(int index) onTap;
  final BottomNavigationBarType type;
  final Color selectedItemColor;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.red,
      type: BottomNavigationBarType.fixed,
      items: items,
    );
  }
}
