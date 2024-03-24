import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'package:path/path.dart';

class BusStopRepository {
  static List<BusStop> getBusStops() {
    List<BusStop> busStops = [];

    // To read the CSV file
    String csvString = File('bus_stop_unused_2.csv').readAsStringSync();

    // To parse the CSV data
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);

    // To convert CSV rows to BusStop objects
    for (var row in csvTable) {
      int id = row[0] as int;
      String longName = row[1] as String;
      String shortName = row[2] as String;
      busStops.add(BusStop(id: id, long_name: longName, short_name: shortName));
    }

    return busStops;
  }
}