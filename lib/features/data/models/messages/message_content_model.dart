import 'package:trekr_second/features/domain/entities/messages/message_content_entity.dart';

class MessageContentModel extends MessageContentEntity {
  final int userId;
  final String content;

  MessageContentModel({required this.userId, required this.content})
      : super(userId: userId, content: content);
}
