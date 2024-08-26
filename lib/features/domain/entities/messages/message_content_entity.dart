import 'package:equatable/equatable.dart';

class MessageContentEntity extends Equatable {
  final int userId;
  final String content;

  const MessageContentEntity({required this.userId, required this.content});
  @override
  // TODO: implement props
  List<Object?> get props => [userId, content];
}
