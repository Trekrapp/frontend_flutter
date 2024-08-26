import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/posts/post_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchPostsByPostIdUseCase {
  final Repository repository;
  FetchPostsByPostIdUseCase({required this.repository});
  Future<Either<Failure, List<PostEntity>>> callback(int postId) {
    return repository.fetchPostsByPostId(postId);
  }
}
