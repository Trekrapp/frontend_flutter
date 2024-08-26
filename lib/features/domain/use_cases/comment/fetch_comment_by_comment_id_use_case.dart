import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/comment/comment_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchCommentByCommentIdUseCase {
  final Repository repository;
  FetchCommentByCommentIdUseCase({required this.repository});
  Future<Either<Failure, CommentEntity>> callback(int commentId) {
    return repository.fetchCommentByCommentID(commentId);
  }
}
