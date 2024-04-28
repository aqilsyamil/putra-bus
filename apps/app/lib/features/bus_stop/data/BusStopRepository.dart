import 'package:csv/csv.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class BusStopRepository {
  static Future<List<BusStop>> getBusStops() async {
    List<BusStop> busStops = [];

    await rootBundle.loadString("assets/dummy_data/bus_stop.csv").then((rawData) {
      List<List<dynamic>> listData =
          const CsvToListConverter(eol: '\n', fieldDelimiter: ',').convert(rawData).toList();
      for (var row in listData.sublist(1)) {
        int id = row[0] as int;
        String long_name = row[1] as String;
        String short_name = row[2] as String;
        String image_path = row[3] as String;
        busStops.add(BusStop(id: id, long_name: long_name, short_name: short_name, image_path: image_path));
      }
      return busStops;
    });

    return busStops;
  }
}
