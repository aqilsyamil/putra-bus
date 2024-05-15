import 'package:app/src/features/navigation/domain/coordinate.dart';
import 'package:equatable/equatable.dart';

class BusStop extends Equatable {
  const BusStop(
      {required this.id,
      required this.fullName,
      required this.shortName,
      required this.position,
      required this.imagePath});

  final String id;
  final String fullName;
  final String shortName;
  final Coordinate position;
  final String imagePath;

  @override
  get props => [id, fullName, shortName, position, imagePath];

  @override
  bool get stringify => true;

  factory BusStop.fromMap(Map<dynamic, dynamic> value) {
    final String id = value['id'].toString();
    final String fullName = value['full_name'] as String;
    final String shortName = value['short_name'] as String;
    final double latitude = value['latitude'] as double;
    final double longitude = value['longitude'] as double;
    final String imagePath = value['image_path'] as String;

    return BusStop(
        id: id,
        fullName: fullName,
        shortName: shortName,
        position: Coordinate(latitude, longitude),
        imagePath: imagePath);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'full_name': fullName,
      'short_name': shortName,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'image_path': imagePath
    };
  }
}
