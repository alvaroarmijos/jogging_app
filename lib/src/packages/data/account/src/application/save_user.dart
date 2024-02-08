import 'package:tracking_app/src/packages/data/account/src/domain/user/user.dart';
import 'package:tracking_app/src/packages/data/account/src/domain/user/user_repository.dart';

class SaveUser {
  final UserRepository _userRepository;

  SaveUser(this._userRepository);

  Future<void> call(User user) => _userRepository.saveUser(user);
}
