import '../../domain/user/user.dart';
import '../cache_dtos.dart';

class UserMapper {
  const UserMapper();

  User fromCacheDto(UserCacheDto dto) {
    final name = dto.name;
    final age = dto.age;
    final weight = dto.weight;

    return User(
      name,
      age,
      weight,
    );
  }
}
