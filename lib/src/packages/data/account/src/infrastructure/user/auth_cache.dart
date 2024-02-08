import 'dart:convert';

import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:tracking_app/src/packages/data/account/src/infrastructure/cache_dtos.dart';

class AuthCache {
  final String authDataKey = 'authData';

  final RxSharedPreferences _preferences;

  AuthCache(this._preferences);

  Future<void> update(UserCacheDto userDto) => _preferences.setString(
        authDataKey,
        jsonEncode(userDto),
      );

  Stream<UserCacheDto?> get snapshots =>
      _preferences.getStringStream(authDataKey).map(
            (rawDataUser) => rawDataUser != null
                ? UserCacheDto.fromJson(jsonDecode(rawDataUser))
                : null,
          );
}
