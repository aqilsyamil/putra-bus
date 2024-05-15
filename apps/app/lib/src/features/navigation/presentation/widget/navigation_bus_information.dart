import 'package:app/src/widgets/list_items/row_items.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationBusInformation extends HookConsumerWidget {
  const NavigationBusInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RowItems(gap: 10, children: [
      Icon(
        Icons.directions_bus,
        color: Colors.blue[900],
        size: 22,
      ),
      const BusPlateNumberLabel(),
      const BusEstimatedArrivalTime(),
      const BusOccupancyLabel()
    ]);
  }
}

class BusEstimatedArrivalTime extends HookConsumerWidget {
  const BusEstimatedArrivalTime({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text(
      'Arriving',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class BusPlateNumberLabel extends HookConsumerWidget {
  const BusPlateNumberLabel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6), // Adjust the curve as needed
        ),
        child: const Text(
          'BRB6030',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ));
  }
}

class BusOccupancyLabel extends HookConsumerWidget {
  const BusOccupancyLabel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.red[800]!, width: 2),
        ),
        child: Text(
          'High',
          style: TextStyle(
            color: Colors.red[800],
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ));
  }
}
