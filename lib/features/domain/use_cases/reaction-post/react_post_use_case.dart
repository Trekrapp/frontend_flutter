import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/reaction-post/reaction_post_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class ReactPostUseCase {
  final Repository repository;
  ReactPostUseCase({required this.repository});
  Future<Either<Failure, ReactionPostEntity>> callback(
      int postId, String type) {
    return repository.reactPost(postId, type);
  }
}
