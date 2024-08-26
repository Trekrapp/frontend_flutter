import 'package:trekr_second/features/data/models/friend-request/sender_model.dart';
import 'package:trekr_second/features/domain/entities/messages/message_entity.dart';

class MessageModel extends MessageEntity {
  int? id;
  String? content;
  String? timestamp;
  SenderModel? sender;
  SenderModel? recipient;

  MessageModel(
      {this.id, this.content, this.timestamp, this.sender, this.recipient});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    timestamp = json['timestamp'];
    sender =
        json['sender'] != null ? SenderModel.fromJson(json['sender']) : null;
    recipient = json['recipient'] != null
        ? SenderModel.fromJson(json['recipient'])
        : null;
  }
  static List<MessageModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MessageModel.fromJson(json)).toList();
  }
}
