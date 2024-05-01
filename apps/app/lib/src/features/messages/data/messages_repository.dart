import 'dart:io';

import 'package:app/src/features/messages/domain/message.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_repository.g.dart';

class MessagesRepository {
  const MessagesRepository(this.messagesFileName);

  final String messagesFileName;

  Future<void> addEntry(
      {required String id,
      required String title,
      required String message,
      required String date,
      required String time}) async {
    List<Message> messages = await readMessages();
    List<String> rowHeader = ['id', 'title', 'message', 'date', 'time'];

    messages.add(Message(
        id: id,
        title: title,
        message: message,
        dateTime: DateTime.parse('$date $time')));

    List<List<dynamic>> csvData = [
      rowHeader,
      ...<dynamic>[messages]
    ];
    String csv = const ListToCsvConverter().convert(csvData);
    final String dir = (await getApplicationDocumentsDirectory()).path;
    // create file
    final File file = File('$dir/$messagesFileName');
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);
  }

  Future<void> updateMessage(
      {required String id,
      required String title,
      required String message,
      required String date,
      required String time}) async {
    List<Message> messages = await readMessages();
    List<String> rowHeader = ['id', 'title', 'message', 'date', 'time'];

    List<dynamic> messagesCsv = [
      ...<dynamic>[messages]
    ];

    messagesCsv.map((message) {
      if (message) {
        message['id'] = id;
        message['title'] = title;
        message['message'] = message;
        message['date'] = date;
        message['time'] = time;
      }
    });

    List<List<dynamic>> csvData = [rowHeader, ...messagesCsv];
    String csv = const ListToCsvConverter().convert(csvData);
    final String dir = (await getApplicationDocumentsDirectory()).path;
    // create file
    final File file = File('$dir/$messagesFileName');
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);
  }

  Future<void> deleteMessage({required String id}) async {
    List<Message> messages = await readMessages();
    List<String> rowHeader = ['id', 'title', 'message', 'date', 'time'];

    messages.removeWhere((message) => message.id == id);

    List<List<dynamic>> csvData = [
      rowHeader,
      ...<dynamic>[messages]
    ];
    String csv = const ListToCsvConverter().convert(csvData);
    final String dir = (await getApplicationDocumentsDirectory()).path;
    // create file
    final File file = File('$dir/$messagesFileName');
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);
  }

  Future<List<Message>> readMessages() async {
    var result = await rootBundle.loadString(messagesFileName);
    List<List<dynamic>> messagesCsv =
        const CsvToListConverter(eol: '\n', fieldDelimiter: ',')
            .convert(result)
            .toList();

    List<Message> messages =
        messagesCsv.getRange(1, messagesCsv.length).map((message) {
      return Message.fromMap({
        'id': message[0],
        'title': message[1],
        'message': message[2],
        'date': message[3],
        'time': message[4]
      });
    }).toList();

    return messages;
  }
}

@riverpod
MessagesRepository messagesRepository(MessagesRepositoryRef ref) {
  return const MessagesRepository('assets/messages.csv');
}
