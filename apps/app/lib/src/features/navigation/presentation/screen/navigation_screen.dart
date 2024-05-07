import 'package:app/src/features/navigation/presentation/widget/navigation_search_fields.dart';
import 'package:app/src/widgets/bar/app_bar.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Navigation'),
      body: Column(
        children: [
          NavigationSearchFields(),
        ],
      ),
    );
  }
}
