import 'package:app/src/common_widgets/bar/app_bar.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Messages'), // Custom app bar
      body: Container(
        alignment: Alignment.center,
        child:
            const Text('Messages', style: TextStyle(height: 5, fontSize: 45)),
      ), // Empty body
    );
  }
}
