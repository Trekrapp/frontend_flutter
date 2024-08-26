part of 'get_messages_cubit.dart';

sealed class GetMessagesState extends Equatable {
  const GetMessagesState();
}

final class GetMessagesInitial extends GetMessagesState {
  @override
  List<Object> get props => [];
}

final class GetMessagesLoading extends GetMessagesState {
  @override
  List<Object> get props => [];
}

final class GetMessagesLoaded extends GetMessagesState {
  final List<MessageEntity> messages;

  const GetMessagesLoaded({required this.messages});
  @override
  List<Object> get props => [messages];
}

final class GetMessagesFailure extends GetMessagesState {
  final String message;

  const GetMessagesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
