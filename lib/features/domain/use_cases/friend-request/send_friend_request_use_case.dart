import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/friend_request_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class SendFriendRequestUseCase {
  final Repository repository;
  SendFriendRequestUseCase({required this.repository});
  Future<Either<Failure, FriendRequestEntity>> callback(int receiverId) {
    return repository.sendFriendRequest(receiverId);
  }
}
