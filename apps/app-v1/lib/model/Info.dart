import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoWindowModel {
  String id;
  String title;
  LatLng position;
  InfoWindowModel({required this.id, required this.title, required this.position});
}
