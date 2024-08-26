import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/search/search_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class SearchPostsAndUsersUseCase {
  final Repository repository;
  SearchPostsAndUsersUseCase({required this.repository});
  Future<Either<Failure, SearchEntity>> callback(String query) {
    return repository.searchPostsAndUsers(query);
  }
}
