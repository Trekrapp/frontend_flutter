import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../entities/user/request_body_register_entity.dart';
import '../../repositories/repository.dart';

class RegisterUserUseCase {
  final Repository repository;
  RegisterUserUseCase({required this.repository});
  Future<Either<Failure, String>> callback(RequestBodyRegisterEntity users) {
    return repository.registerUser(users);
  }
}
