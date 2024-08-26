import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/user/user_friend_response_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchFriendsOfUserUseCase {
  final Repository repository;
  FetchFriendsOfUserUseCase({required this.repository});
  Future<Either<Failure, List<UserFriendResponseEntity>>> callback() {
    return repository.fetchFriendOfUser();
  }
}
