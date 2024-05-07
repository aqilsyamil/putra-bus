import 'package:app/src/features/navigation/presentation/widget/navigation_bus_information.dart';
import 'package:app/src/widgets/list_items/column_items.dart';
import 'package:app/src/widgets/list_items/row_items.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationAvailableRoutesList extends HookConsumerWidget {
  const NavigationAvailableRoutesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          height: 25,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 2), // Adjusted padding
          alignment: Alignment.centerLeft,
          color: Colors.grey[200],
          child: const Text(
            'Available Routes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
        ListView(shrinkWrap: true, children: const [
          AvailableRouteTile(),
          AvailableRouteTile(),
          AvailableRouteTile(),
        ])
      ],
    );
  }
}

class AvailableRouteTile extends HookConsumerWidget {
  const AvailableRouteTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const RowItems(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      gap: 10,
      children: [
        AvailableRouteNumberedIcon(
          color: Colors.blueAccent,
        ),
        Text(
          'Route 1',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        ColumnItems(
          gap: 10,
          children: [NavigationBusInformation(), NavigationBusInformation()],
        )
      ],
    );
  }
}

class AvailableRouteNumberedIcon extends HookConsumerWidget {
  const AvailableRouteNumberedIcon({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: color),
            shape: BoxShape.circle),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            '1',
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          ),
        ));
  }
}
