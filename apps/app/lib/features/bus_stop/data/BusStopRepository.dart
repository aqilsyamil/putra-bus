import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class BusStopRepository {
  static Future<List<BusStop>> fetchBusStops() async {
    final response = await http
        .get(Uri.parse('https://putrabus-api.up.railway.app/bus-stops'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      final List body = jsonDecode(response.body);
      // body.map((jsonBusStop) => print(jsonBusStop));
      return body.map((jsonBusStop) => BusStop.fromJson(jsonBusStop)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load bus stops');
    }
  }

  // static Future<List<BusStop>> getBusStops() async {
  //   List<BusStop> busStops = [];

  //   await rootBundle.loadString("assets/bus_stop.csv").then((rawData) {
  //     List<List<dynamic>> listData =
  //         const CsvToListConverter(eol: '\n', fieldDelimiter: ',')
  //             .convert(rawData)
  //             .toList();
  //     for (var row in listData.sublist(1)) {
  //       String id = row[0] as String;
  //       String long_name = row[1] as String;
  //       String short_name = row[2] as String;
  //       String image_path = row[3] as String;
  //       busStops.add(BusStop(
  //           id: id,
  //           long_name: long_name,
  //           short_name: short_name,
  //           image_path: image_path));
  //     }
  //     return busStops;
  //   });

  //   return busStops;
  // }
}
