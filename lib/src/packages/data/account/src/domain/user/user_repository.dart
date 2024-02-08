import 'package:tracking_app/src/packages/data/account/src/domain/user/user.dart';

abstract class UserRepository {
  Future<void> saveUser(User user);

  Stream<bool> checkUser();
}
