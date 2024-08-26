import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/user/nearby_user_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class FetchNearbyUserUseCase {
  final Repository repository;
  FetchNearbyUserUseCase({required this.repository});
  Future<Either<Failure, List<NearbyUserEntity>>> callback(
      double latitude, double longitude, double distance) {
    return repository.fetchNearbyUser(latitude, longitude, distance);
  }
}
