import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'Bus.dart';

class Buses {
  // Private Map to store Bus objects, keyed by a String
  Map<String, Bus> _buses = {};

  // Constructor
  Buses();

  void getData() async {
   Directory dir = await getApplicationDocumentsDirectory();
   String rootPath = dir.path;
   String targetPath = 'data/bus_data.csv';
   String filePath = '$rootPath/$targetPath';
   print(filePath);
   File file = File(filePath);
   String contents = await file.readAsString();
   List<List<dynamic>> data = const CsvToListConverter().convert(contents);

   print(data);
  }

  // Getter for _buses
  Map<String, Bus> get buses => _buses;

  // Setter for _buses
  set buses(Map<String, Bus> newBuses) {
    _buses = newBuses;
  }

  // Add a bus method
  void addBus(String key, Bus bus) {
    _buses[key] = bus;
  }

  // Delete a bus method
  void deleteBus(String key) {
    _buses.remove(key);
  }

  // Modify a bus method
  void modifyBus(String key, Bus newBus) {
    if (_buses.containsKey(key)) {
      _buses[key] = newBus;
    }
  }

  // Print all buses method
  void printAllBuses() {
    _buses.forEach((key, bus) {
      print('Key: $key, Bus: ${bus.toString()}'); // Assuming Bus class has a toString method
    });
  }
}
