import '../domain/user/auth_repository.dart';
import '../domain/user/user.dart';

class GetCurrentUser {
  final AuthRepository _authRepository;

  const GetCurrentUser(this._authRepository);

  Stream<User?> call() => _authRepository.currentUser;
}
