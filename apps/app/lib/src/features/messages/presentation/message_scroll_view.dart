import 'package:app/src/common_widgets/list_items/list_items_builder.dart';
import 'package:app/src/features/messages/domain/message.dart';
import 'package:app/src/features/messages/presentation/messages_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class MessageScrollView extends HookConsumerWidget {
  const MessageScrollView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 300.0,
      child: Consumer(builder: (context, ref, child) {
        final messages = ref.watch(messagesServiceProvider);

        return ListItemsBuilder<Message>(
          data: messages,
          gap: 5.0,
          itemBuilder: (context, message) => MessageListTile(
            title: message.title,
            message: message.message,
            dateTime: message.dateTime,
          ),
        );
      }),
    );
  }
}

class MessageListTile extends StatelessWidget {
  const MessageListTile(
      {super.key,
      required this.title,
      required this.message,
      required this.dateTime});

  final String title;
  final String message;
  final IconData icon = Icons.message;
  final Color color = Colors.red;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: (Colors.red[800])!, width: 2.0),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: ListTile(
                leading: Icon(icon, color: color),
                title: Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(message),
                trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(Jiffy.parse(dateTime.toString()).fromNow()),
                      Text(DateFormat('hh:mm a').format(dateTime))
                    ]))));
  }
}
