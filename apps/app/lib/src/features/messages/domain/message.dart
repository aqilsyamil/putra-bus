import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Message extends Equatable {
  const Message(
      {required this.id,
      required this.title,
      required this.message,
      required this.dateTime});

  final String id;
  final String title;
  final String message;
  final DateTime dateTime;

  @override
  get props => [id, title, message, dateTime];

  @override
  bool get stringify => true;

  factory Message.fromMap(Map<dynamic, dynamic> value) {
    final String id = value['id'].toString();
    final String title = value['title'] as String;
    final String message = value['message'] as String;
    final String date = value['date'] as String;
    final String time = value['time'] as String;

    final DateTime dateTime = DateTime.parse('$date $time');

    return Message(id: id, title: title, message: message, dateTime: dateTime);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'message': message,
      'date': DateFormat('dd-MM-yyyy').format(dateTime),
      'time': DateFormat('HH:mm:ss').format(dateTime)
    };
  }
}
