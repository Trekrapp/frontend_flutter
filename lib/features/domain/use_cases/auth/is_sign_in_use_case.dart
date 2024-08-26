import '../../repositories/repository.dart';

class IsSignInUseCase {
  final Repository repository;
  IsSignInUseCase({required this.repository});
  Future<bool> callback() {
    return repository.isSignIn();
  }
}
