import 'package:app/src/widgets/bar/app_bar.dart';
import 'package:app/src/widgets/list_items/list_items_builder.dart';
import 'package:flutter/material.dart';
import 'package:app/src/features/bus_stop/presentation/controller/bus_stop_controller.dart';
import 'package:app/src/widgets/dialog/image_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BusStopScreen extends HookConsumerWidget {
  const BusStopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final busStops = ref.watch(busStopServiceProvider);

    return MaterialApp(
      title: 'Bus Stops App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar:
              const CustomAppBar(title: 'Bus Stops'), // Use CustomAppBar here
          body: ListItemsBuilder(
              data: busStops,
              itemBuilder: (context, busStop) => ListTile(
                    title: Text(busStop.fullName),
                    subtitle: Text(busStop.shortName),
                    leading: GestureDetector(
                      onTap: () {
                        ImageDialog.of(context)
                            .showImageNetworkDialog(busStop.imagePath);
                      },
                      child: const Icon(Icons.info),
                    ),
                    onTap: () {
                      // You can perform actions when a bus stop is tapped
                    },
                  ))),
    );
  }
}
