import 'package:tracking_app/src/packages/data/account/src/domain/user/user.dart';

import '../domain/user/auth_repository.dart';

class SaveUser {
  final AuthRepository _authRepository;

  const SaveUser(this._authRepository);

  Future<void> call(User user) => _authRepository.saveUser(user);
}
