import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/sender_entity.dart';

enum MessageType { system, user }

class MessageEntity extends Equatable {
  final int? id;
  final String? content;
  final String? timestamp;
  final SenderEntity? sender;
  final SenderEntity? recipient;
  final MessageType? messageType;

  const MessageEntity(
      {this.id,
      this.content,
      this.timestamp,
      this.sender,
      this.recipient,
      this.messageType});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
