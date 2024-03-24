import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:app/features/bus_stop/domain/BusStop.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BusStopRepository {
  static List<BusStop> getBusStops() {
    List<BusStop> busStops = [];

    listFilesInCurrentDirectory();

    // To read the CSV file
    String csvString = File('bus_stop.csv').readAsStringSync();

    // To parse the CSV data
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);

    // To convert CSV rows to BusStop objects
    for (var row in csvTable) {
      int id = row[0] as int;
      String longName = row[1] as String;
      String shortName = row[2] as String;
      busStops.add(BusStop(id: id, longName: longName, shortName: shortName));
    }

    return busStops;
  }

  static Future<void> listFilesInCurrentDirectory() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
    }

    final currentDirectory = Directory.current;
    final files = await currentDirectory.list().toList();

    for (var file in files) {
      print(file.path);
    }
  }

  static Future<void> readCSVFile() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/bus_stop.csv';

    File file = File(filePath);
    List<List<dynamic>> csvData = const CsvToListConverter().convert(await file.readAsString());
    
    print(csvData);
    // Now you can use the csvData for further processing
  }
  
}