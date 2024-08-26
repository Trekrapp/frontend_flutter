import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/user/user_entity.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class LoginUserUseCase {
  final Repository repository;
  LoginUserUseCase({required this.repository});
  Future<Either<Failure, UserEntity>> callback(
      String usernameOrMail, String password) {
    return repository.loginUser(usernameOrMail, password);
  }
}
