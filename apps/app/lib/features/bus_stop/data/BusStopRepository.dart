import 'package:csv/csv.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class BusStopRepository {
  static Future<List<BusStop>> getBusStops() async {
    List<BusStop> busStops = [];

    await rootBundle.loadString("assets/bus_stop.csv").then((rawData) {
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(rawData).toList();
      for (var row in listData.sublist(1)) {
        int id = row[0] as int;
        String longName = row[1] as String;
        String shortName = row[2] as String;
        busStops.add(BusStop(id: id, longName: longName, shortName: shortName));
      }
      return busStops;
    });

    return busStops;
  }
}
