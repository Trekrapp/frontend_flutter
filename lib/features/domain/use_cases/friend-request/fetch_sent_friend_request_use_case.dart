import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/friend_request_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchSentFriendRequestUseCase {
  final Repository repository;
  FetchSentFriendRequestUseCase({required this.repository});
  Future<Either<Failure, List<FriendRequestEntity>>> callback() {
    return repository.fetchSentFriendRequest();
  }
}
