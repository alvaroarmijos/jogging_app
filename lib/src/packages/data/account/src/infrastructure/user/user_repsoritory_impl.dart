import 'package:tracking_app/src/packages/data/account/src/domain/user/user.dart';
import 'package:tracking_app/src/packages/data/account/src/domain/user/user_repository.dart';
import 'package:tracking_app/src/packages/data/account/src/infrastructure/cache_dtos.dart';
import 'package:tracking_app/src/packages/data/account/src/infrastructure/user/auth_cache.dart';

class UserRepositoryImpl extends UserRepository {
  final AuthCache _authCache;

  UserRepositoryImpl(this._authCache);

  @override
  Stream<bool> checkUser() =>
      _authCache.snapshots.map((userCacheDto) => userCacheDto != null);

  @override
  Future<void> saveUser(User user) => _authCache.update(
        UserCacheDto.fromEntity(user),
      );
}
