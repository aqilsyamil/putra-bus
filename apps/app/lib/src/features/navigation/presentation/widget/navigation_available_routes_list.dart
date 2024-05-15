import 'package:app/src/features/navigation/domain/route.dart';
import 'package:app/src/features/navigation/presentation/widget/navigation_bus_information.dart';
import 'package:app/src/widgets/list_items/column_items.dart';
import 'package:app/src/widgets/list_items/row_items.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationAvailableRoutesList extends HookConsumerWidget {
  const NavigationAvailableRoutesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
        child: Column(
      children: [
        Container(
          height: 25,
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
        Expanded(
            child: ListView(children: const [
          AvailableRouteTile(BusRoute(id: '1', name: 'Route 1', links: [])),
          AvailableRouteTile(BusRoute(id: '2', name: 'Route 2', links: [])),
          AvailableRouteTile(BusRoute(id: '3', name: 'Route 3', links: [])),
          AvailableRouteTile(BusRoute(id: '4', name: 'Route 4', links: [])),
          AvailableRouteTile(BusRoute(id: '5', name: 'Route 5', links: [])),
        ]))
      ],
    ));
  }
}

class AvailableRouteTile extends HookConsumerWidget {
  const AvailableRouteTile(this.route, {super.key});

  final BusRoute route;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: RowItems(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        gap: 10,
        children: [
          AvailableRouteNumberedIcon(
            route.id,
            color: Colors.blueAccent,
          ),
          Text(
            route.name,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.0,
            ),
          ),
          const ColumnItems(
            gap: 10,
            children: [NavigationBusInformation(), NavigationBusInformation()],
          )
        ],
      ),
    );
  }
}

class AvailableRouteNumberedIcon extends HookConsumerWidget {
  const AvailableRouteNumberedIcon(this.routeId,
      {super.key, required this.color});

  final Color color;
  final String routeId;

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
            routeId,
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
