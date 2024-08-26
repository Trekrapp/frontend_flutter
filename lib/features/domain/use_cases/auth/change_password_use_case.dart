import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class ChangePasswordUserUseCase {
  final Repository repository;
  ChangePasswordUserUseCase({required this.repository});
  Future<Either<Failure, String>> callback(
      String oldPassword, String newPassword) {
    return repository.changePassword(oldPassword, newPassword);
  }
}
