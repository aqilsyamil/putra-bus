import 'package:app/src/common_widgets/bar/app_bar.dart';
import 'package:app/src/common_widgets/list_items_builder.dart';
import 'package:app/src/features/messages/application/messages_service.dart';
import 'package:app/src/features/messages/domain/message.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Messages'), // Custom app bar
      body: Consumer(builder: (context, ref, child) {
        final messages = ref.watch(messagesServiceProvider);

        return ListItemsBuilder<Message>(
          data: messages,
          itemBuilder: (context, model) => ListTile(
            title: Text(model.title),
            subtitle: Text(model.message),
          ),
        );
      }), // Empty body
    );
  }
}
