// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagesRepositoryHash() =>
    r'c2e307c3444ce7e25917209df902e94faead4a05';

/// See also [messagesRepository].
@ProviderFor(messagesRepository)
final messagesRepositoryProvider = Provider<MessagesRepository>.internal(
  messagesRepository,
  name: r'messagesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messagesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MessagesRepositoryRef = ProviderRef<MessagesRepository>;
String _$fetchMessagesHash() => r'd23d71ba73eeb008a282abf2f17c9a7163cdf9a5';

/// See also [fetchMessages].
@ProviderFor(fetchMessages)
final fetchMessagesProvider = StreamProvider<List<Message>>.internal(
  fetchMessages,
  name: r'fetchMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMessagesRef = StreamProviderRef<List<Message>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
