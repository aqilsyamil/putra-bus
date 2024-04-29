import 'package:flutter/material.dart';
import 'package:app/components/bars/appbar.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Navigation'),
      body: Container(
        alignment: Alignment.center,
        child:
            const Text('Navigation', style: TextStyle(height: 5, fontSize: 45)),
      ),
    );
  }
}
