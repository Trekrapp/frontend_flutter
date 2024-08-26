import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/user/user_response_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class UserInformationUseCase {
  final Repository repository;
  UserInformationUseCase({required this.repository});
  Future<Either<Failure, UserResponseEntity>> callback() {
    return repository.userInformation();
  }
}
