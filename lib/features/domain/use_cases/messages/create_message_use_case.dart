import 'package:trekr_second/features/domain/entities/messages/message_content_entity.dart';

import '../../repositories/repository.dart';

class CreateMessageUseCase {
  final Repository repository;
  CreateMessageUseCase({required this.repository});
  Future<void> callback(MessageContentEntity message) async {
    repository.createMessage(message);
  }
}
