import 'dart:convert';

import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:tracking_app/src/packages/data/account/src/domain/user/auth_repository.dart';
import 'package:tracking_app/src/packages/data/account/src/infrastructure/cache_dtos.dart';

import '../../domain/user/user.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authCache);

  final AuthCache _authCache;

  @override
  Future<void> saveUser(User user) =>
      _authCache.update(UserCacheDto.fromEntity(user));

  @override
  Stream<bool> checkUser() =>
      _authCache.snapshots.map((userCacheDto) => userCacheDto != null);
}

class AuthCache {
  static String authDataKey = 'authData';

  const AuthCache(this._preferences);

  final RxSharedPreferences _preferences;

  Future<void> update(UserCacheDto userCacheDto) =>
      _preferences.setString(authDataKey, jsonEncode(userCacheDto));

  Stream<UserCacheDto?> get snapshots =>
      _preferences.getStringStream(authDataKey).map(
            (rawUserData) => rawUserData != null
                ? UserCacheDto.fromJson(jsonDecode(rawUserData))
                : null,
          );
}
