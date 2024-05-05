import 'package:app/src/features/messages/data/messages_repository.dart';
import 'package:app/src/features/messages/domain/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_controller.g.dart';

class MessagesController {
  MessagesController(this.messagesRepository);

  final MessagesRepository messagesRepository;

  Future<List<Message>> getMessages() async {
    List<Message> messages = await messagesRepository.readMessages();

    return messages;
  }
}

@Riverpod(keepAlive: true)
Future<List<Message>> messagesService(MessagesServiceRef ref) async {
  return await MessagesController(
          const MessagesRepository('assets/messages.csv'))
      .getMessages();
}
