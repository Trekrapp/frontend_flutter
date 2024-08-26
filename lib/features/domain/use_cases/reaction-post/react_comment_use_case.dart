import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/reaction-post/reaction_post_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class ReactCommentUseCase {
  final Repository repository;
  ReactCommentUseCase({required this.repository});
  Future<Either<Failure, ReactionPostEntity>> callback(
      int commentId, String type) {
    return repository.reactComment(commentId, type);
  }
}
