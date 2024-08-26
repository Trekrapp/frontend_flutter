import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/repository.dart';

class ForgotPasswordUseCase {
  final Repository repository;
  ForgotPasswordUseCase({required this.repository});
  Future<Either<Failure, String>> callback(String email) {
    return repository.forgotPassword(email);
  }
}
