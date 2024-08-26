import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../entities/user/request_update_profile_entity.dart';
import '../../repositories/repository.dart';

class UpdateProfileUseCase {
  final Repository repository;
  UpdateProfileUseCase({required this.repository});
  Future<Either<Failure, String>> callback(
      RequestUpdateProfileEntity requestUpdateProfile) {
    return repository.updateProfile(requestUpdateProfile);
  }
}
