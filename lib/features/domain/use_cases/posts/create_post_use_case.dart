import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/posts/post_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class CreatePostUseCase {
  final Repository repository;
  CreatePostUseCase({required this.repository});
  Future<Either<Failure, PostEntity>> callback(
      String content, String mediaFile) {
    return repository.createPost(content, mediaFile);
  }
}
