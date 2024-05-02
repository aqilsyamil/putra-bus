import 'package:app/src/common_widgets/bar/app_bar.dart';
import 'package:app/src/features/messages/presentation/message_info.dart';
import 'package:app/src/features/messages/presentation/message_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessagesScreen extends HookConsumerWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Messages'), // Custom app bar
      body: Column(children: <Widget>[MessageScrollView(), MessageInfo()]),
    );
  }
}
