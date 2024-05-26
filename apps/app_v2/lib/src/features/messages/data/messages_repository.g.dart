// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagesRepositoryHash() =>
    r'f2cec7ca0d968350e72047b8d48cb8db8bc6b25c';

/// See also [messagesRepository].
@ProviderFor(messagesRepository)
final messagesRepositoryProvider =
    AutoDisposeProvider<MessagesRepository>.internal(
  messagesRepository,
  name: r'messagesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messagesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MessagesRepositoryRef = AutoDisposeProviderRef<MessagesRepository>;
String _$fetchMessagesHash() => r'1fd4e28be10b8f92995d026fcba594fedbeb142f';

/// See also [fetchMessages].
@ProviderFor(fetchMessages)
final fetchMessagesProvider = AutoDisposeStreamProvider<List<Message>>.internal(
  fetchMessages,
  name: r'fetchMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMessagesRef = AutoDisposeStreamProviderRef<List<Message>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
