import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class ResetPasswordUseCase {
  final Repository repository;
  ResetPasswordUseCase({required this.repository});
  Future<Either<Failure, String>> callback(String token, String newPassword) {
    return repository.resetPassword(token, newPassword);
  }
}
