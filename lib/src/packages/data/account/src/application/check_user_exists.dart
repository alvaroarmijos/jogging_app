import '../domain/user/user_repository.dart';

class CheckUserExists {
  final UserRepository _userRepository;

  CheckUserExists(this._userRepository);

  Stream<bool> call() => _userRepository.checkUser();
}
