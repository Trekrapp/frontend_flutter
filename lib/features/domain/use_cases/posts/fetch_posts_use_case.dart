import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/posts/post_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchPostsUseCase {
  final Repository repository;
  FetchPostsUseCase({required this.repository});
  Future<Either<Failure, List<PostEntity>>> callback() {
    return repository.fetchPosts();
  }
}
