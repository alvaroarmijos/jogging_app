import 'package:tracking_app/src/packages/data/account/src/domain/user/user.dart';

abstract class AuthRepository {
  Future<void> saveUser(User user);

  Stream<bool> checkUser();

  Stream<User?> get currentUser;
}
