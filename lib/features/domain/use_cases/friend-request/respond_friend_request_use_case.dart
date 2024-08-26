import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/friend_request_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class RespondFriendRequestUseCase {
  final Repository repository;
  RespondFriendRequestUseCase({required this.repository});
  Future<Either<Failure, FriendRequestEntity>> callback(
      int requestId, String status) {
    return repository.respondFriendRequest(requestId, status);
  }
}
