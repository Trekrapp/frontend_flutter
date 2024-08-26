import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/posts/feed_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchFeedUseCase {
  final Repository repository;
  FetchFeedUseCase({required this.repository});
  Future<Either<Failure, FeedEntity>> callback(int page, int size) {
    return repository.fetchFeeds(page, size);
  }
}
