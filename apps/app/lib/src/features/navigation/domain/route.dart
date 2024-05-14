import 'package:app/src/features/navigation/domain/link.dart';
import 'package:equatable/equatable.dart';

class BusRoute extends Equatable {
  const BusRoute({required this.id, required this.name, required this.links});

  final String id;
  final String name;
  final List<Link> links;

  @override
  get props => [id, name, links];

  @override
  bool get stringify => true;

  factory BusRoute.fromMap(Map<dynamic, dynamic> value) {
    final String id = value['id'].toString();
    final String name = value['name'] as String;
    final List<Link> links =
        value['links'].map<Link>((dynamic value) => Link.fromMap(value));

    return BusRoute(id: id, name: name, links: links);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'links': links};
  }
}
