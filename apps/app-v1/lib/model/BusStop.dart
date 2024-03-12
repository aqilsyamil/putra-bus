import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';
class BusStop {
  String _id;
  String _fullName;
  String _shortName;
  LatLng _coordinate;
  String _imagePath;

  // Constructor
  BusStop({
    required String id,
    required String fullName,
    required String shortName,
    required LatLng coordinate,
    String imagePath = 'assets/images/default.jpg',
  })  : _id = id,
        _fullName = fullName,
        _shortName = shortName,
        _coordinate = coordinate,
        _imagePath = imagePath;

  // Getters
  String get id => _id;

  String get fullName => _fullName;

  String get shortName => _shortName;

  LatLng get coordinate => _coordinate;

  bool _checkImagePathExist(String imagePath) {
    File imageFile = File(imagePath);
    return imageFile.existsSync();
  }

  String get imagePath {
    if (!_checkImagePathExist(imagePath)) {
       return 'assets/images/default.jpg';
    }

    return _imagePath;
  }

  // Setters
  set id(String value) {
    _id = value;
  }

  set fullName(String value) {
    _fullName = value;
  }

  set shortName(String value) {
    _shortName = value;
  }

  set coordinate(LatLng value) {
    _coordinate = value;
  }

  set imagePath(String value) {
    _imagePath = value;

    if (!_checkImagePathExist(_imagePath)) {
      _imagePath = 'assets/images/default.jpg';
    }
  }
}